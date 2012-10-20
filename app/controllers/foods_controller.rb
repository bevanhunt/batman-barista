class FoodsController < ApplicationController
  respond_to :json

  def index
    respond_with Food.all
  end

  def show
    food = Food.find(params[:id])
    respond_with food
  end

  def create
    respond_with Food.create(params[:food])
  end

  def update
    food = Food.find(params[:id])
    respond_with food.update_attributes(params[:food])
  end

  def destroy
    food = Food.find(params[:id])
    respond_with food.destroy
  end
end