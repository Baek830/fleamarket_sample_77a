class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def new
    @categories = Category.all
  end
  def show
    @product = Product.find(params[:id])
  end

end
