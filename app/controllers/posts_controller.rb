class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :authorize_user!, only: %i[ edit update destroy]
  before_action :destroy_convo, only: %i[ destroy ]
  
  # GET /posts or /posts.json
  def index
    @posts = Post.where(sold: false).or(Post.where(sold: nil)).order("created_at DESC")
  end

  # GET /posts/1 or /posts/1.json
  def show
    @convo = Convo.create
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
  
    @post.user = current_user

    if params[:post][:images].present?
      params[:post][:images].each do |image|
        if image.respond_to?(:tempfile)
          extension = File.extname(image.original_filename)
          filename = "#{Random.uuid}#{extension}"
          @image = Image.new
          @image.data = filename
          File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
            file.write(image.tempfile.read)
          end

          @image.post = @post
          @image.save
        end
      end
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.user = current_user
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def sold
    @post = Post.find(params[:id])
    @post.sold = true
    @post.save
    redirect_to post_url(@post)
  end

  def unsold
    @post = Post.find(params[:id])
    @post.sold = false
    @post.save
    redirect_to post_url(@post)
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :type_id, image: [])
    end
    def authorize_user!
      unless @post.user == current_user
        redirect_to root_path, notice: "You don't have permissions to do that."
      end
    end
    def destroy_convo
      @post.convo.destroy
    end

end