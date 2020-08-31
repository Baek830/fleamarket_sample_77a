class ProductsController < ApplicationController

  def index
    @product = Product.all.order("created_at DESC").limit(10)
    @brand = Product.where(brand: 'ロレックス').order("created_at DESC").limit(10)
  end

  def new
    @categories = Category.all
  end
  def show
    @product = Product.find(params[:id])
  end

end
