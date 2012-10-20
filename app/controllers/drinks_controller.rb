class DrinksController < ApplicationController
  respond_to :json

  def index
    respond_with Drink.all
  end

  def show
    drink = Drink.find(params[:id])
    respond_with drink
  end

  def create
    respond_with Drink.create(params[:drink])
  end

  def update
    drink = Drink.find(params[:id])
    respond_with drink.update_attributes(params[:drink])
  end

  def destroy
    drink = Drink.find(params[:id])
    respond_with drink.destroy
  end
end