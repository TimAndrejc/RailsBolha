class MessagesController < ApplicationController
    before_action :authenticate_user!, except: %i[ index show ]

    def new
        @message = Message.new
    end

    def create
        @message = Message.new
        @convo = Convo.find(params[:convo_id])
        @message.convo_id = params[:convo_id]
        @message.user = current_user
        @message.body = params[:message][:body]
        respond_to do |format|
        if @message.save
            format.html { redirect_to convo_url(@convo), notice: "Convo was successfully created." }
            format.json { render :show, status: :created, location: @convo }
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
