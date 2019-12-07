class ProductsController < ApplicationController

  def index
  end

  def show
    @video_id = params[:video_id]
    @product = Product.find(params[:id])
  end

end
