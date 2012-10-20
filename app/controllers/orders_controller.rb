class OrdersController < ApplicationController
  respond_to :json

  def index
    respond_with Order.all
  end

  def show
    order = Order.find(params[:id])
    respond_with order
  end

  def create
    respond_with Order.create(params[:order])
  end

  def update
    order = Order.find(params[:id])
    respond_with order.update_attributes(params[:order])
  end

  def destroy
    order = Order.find(params[:id])
    respond_with order.destroy
  end
end