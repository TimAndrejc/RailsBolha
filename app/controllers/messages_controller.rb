class MessagesController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :message_empty, only: %i[ create ]
    def new
        @message = Message.new
    end
    def create
      @message = Message.new(message_params)
      @convo = Convo.find(params[:message][:convo_id])
      @message.convo_id = @convo.id
      @message.user_id = current_user.id
      @message.message = params[:message][:message]
      respond_to do |format|
        if @message.save
          @convo.updated_at = @message.created_at
          @convo.save
          format.html { redirect_to convo_url(@convo)}
          format.json { render :show, status: :created, location: @convo}
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @convo.errors, status: :unprocessable_entity }
        end
      end
    end
end
private
def authorize_user!
  unless @post.user == current_user
    redirect_to root_path, notice: "You don't have permissions to do that."
  end
end
def message_params
  params.require(:message).permit( :message, :convo_id, :user_id)
end
def message_empty
  if params[:message][:message].empty?
    @convo = Convo.find(params[:message][:convo_id])
    redirect_to convo_url(@convo)
  end
end
def authenticate_user! 
  unless user_signed_in?
    flash[:alert] = "You must be logged in to do that."
    redirect_to new_user_session_path
  end
end