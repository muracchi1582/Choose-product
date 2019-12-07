class ProductsController < ApplicationController

  require "payjp"

  def index
  end

  def show
    @video_id = params[:video_id]
    @product = Product.find(params[:id])
  end

  def pay
    product = Product.find(params[:id])
    profit = product.price * product.profit
    video = Video.find(params[:keyword])
    user_id = video.user_id
    Profit.create(product_id:product.id,user_id:user_id,price:profit)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: product.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end
end
