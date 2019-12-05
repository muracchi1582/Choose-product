class ProductsController < ApplicationController

  def index
  end

  def show
    @video_id=params[:video_id]
    @book=Book.find(params[:id])
  end
end
