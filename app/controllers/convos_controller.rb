class ConvosController < ApplicationController
  before_action :set_convo, only: %i[ show edit update destroy ]

  # GET /convos or /convos.json
  def index
    @convos = Convo.all
  end

  # GET /convos/1 or /convos/1.json
  def show
  end

  # GET /convos/new
  def new
    @convo = Convo.new
  end


  # POST /convos or /convos.json
  def create
    @convo = Convo.find_by(post_id: params[:post_id], user: current_user)
  
    if !@convo
      @convo = Convo.new
      @convo.post_id = params[:post_id]
      @convo.user = current_user
      respond_to do |format|
        if @convo.save
          format.html { redirect_to convo_url(@convo), notice: "Convo was successfully created." }
          format.json { render :show, status: :created, location: @convo }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @convo.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to convo_url(@convo), notice: "Convo already exists."
    end
  
    if(@convo.post.user == current_user)
      redirect_to post_url(@convo.post), notice: "You can't buy your own post."
    end
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convo
      @convo = Convo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def convo_params
      params.require(:convo).permit(:post_id, :user_id)
    end
end
