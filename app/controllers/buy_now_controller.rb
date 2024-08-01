class BuyNowController < ApplicationController
  def show
    @product = Product.find(params[:product_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Product not found"
  end
end