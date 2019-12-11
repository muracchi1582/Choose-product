class ProductsController < ApplicationController

  def index
    @products = Product.where( "title LIKE ? ","%#{params[:keyword]}%").limit(4)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @video_id = params[:video_id]
    @product = Product.find(params[:id])
  end

  def pay
    product = Product.find(params[:id])
    History.create(product_id:product.id, user_id:current_user.id, price:product.price)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
    :amount => product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end
end
