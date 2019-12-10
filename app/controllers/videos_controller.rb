class VideosController < ApplicationController
  before_action :video_params,only: [:create]

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
    @product.save
    @video.save
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

  def search
    @videos = Video.where( "title LIKE ? ","%#{params[:keyword]}%")
  end

  def genre
    @tests = params.require(:genre)[:keywords]
    @products2= []
    @tests.each do |test|
      @products = Product.where("genre = ?",test)
      # @product2 << @products
    end
  end
  
  def s3
    s3 = get_s3_resource  # S3.Resourse インスタンスを作成
  end

  private

  def video_params
    params.require(:video).permit(:title, :movie, :image, :product_id, :information)
          .merge(user_id: current_user.id)
  end

  def get_s3_resource
    Aws::S3::Resource.new(region: ap-northeast-1)
  end
end
