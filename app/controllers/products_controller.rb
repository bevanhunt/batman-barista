class ProductsController < ApplicationController
  respond_to :json

  def index
    order = Order.find(params[:order_id])
    respond_with order.products.all
  end

  def show
    product = Product.find(params[:id])
    respond_with product
  end

  def create
    order = Order.find(params[:order_id])
    product = Product.create(params[:product])
    order.products.push(product)
    respond_with product
  end

  def update
    product = Product.find(params[:id])
    respond_with product.update_attributes(params[:product])
  end

  def destroy
    product = Product.find(params[:id])
    respond_with product.destroy
  end
end