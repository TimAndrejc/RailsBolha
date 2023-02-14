class ImageController < ActionController::Base

    def index
        @images = Image.find_by(params[:post_id])
    end
    
    def show
        @image = Image.find(params[:id])
    end
    
    def new
        @image = Image.new
    end
    
    def create
        @image = Image.new(image_params)
        @image.save
    end
    
    
    def destroy
        @image = Image.find(params[:id])
        @image.destroy
    end
    private
    def image_params
        params.require(:data, :post_id)
    end
end
