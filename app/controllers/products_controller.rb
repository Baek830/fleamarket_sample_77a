class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @categories = Category.all
  end
  def show
    @product = Product.includes(:images).find(params[:id])
  end

end
