class ProductsController < ApplicationController

  def index
  end

  def search
    @products = Products.search(params[:keyword])
  end


end
