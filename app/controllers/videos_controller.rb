class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
  end

  def create
    @video = Video.new(video_params)
  end

  private

  def video_params
    params.require(:video).permit(:title, :movie, :image, :product_id, :information)
  end
end
