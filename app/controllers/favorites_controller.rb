class FavoritesController < ApplicationController
  before_action :find_product

def create
  @favorite = Favorite.create(user_id: current_user.id, product_id: @product.id)
end

def destroy
  @favorite = Favorite.find_by(user_id: current_user.id, product_id: @product.id).destroy
end

  private

  def find_product
    @product = Product.find(params[:id])
  end

end
