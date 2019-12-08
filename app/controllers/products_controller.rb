class ProductsController < ApplicationController

  def index
  end

  def show
    @video_id = params[:video_id]
    @product = Product.find(params[:id])
  end

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
    :amount => 3500,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end
end
