class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Products.search(params[:keyword])
  end


end
