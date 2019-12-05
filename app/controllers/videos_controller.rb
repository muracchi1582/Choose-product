class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
    @product = Product.new
    @products = Product.limit(4)
  end

  def create
    @video = Video.new(video_params)
    @product = Product.new
    @video.save
    @product.save
    redirect_to root_path
  end

  def show
    @videos = Video.order(created_at: :DESC).limit(4)
    @video = Video.find(params[:id])
  end

  def destroy
    Video.delete(params[:id])
    redirect_to root_path
  end

  def edit
    @video=Video.find(params[:id])
  end

  

  private

  def video_params
    params.require(:video).permit(:title, :movie, :image, :product_id, :information)
          .merge(user_id: current_user.id)
  end
end
