class ProductsController < ApplicationController

  def index
    @product = Product.all.order("created_at DESC")
  end

  def new
    @categories = Category.all
  end
  def show
    @product = Product.find(params[:id])
  end

end
