class Products::SearchesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @products = Product.search(params[:keyword])
  end
end
