class FavoritesController < ApplicationController
  before_action :find_product
  before_action :find_favorite, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @product.favorites.create(user_id: current_user.id)
    end
    redirect_to product_path(@product)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @favorite.destroy
    end
    redirect_to product_path(@product)
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def already_liked?
    Favorite.where(user_id: current_user.id, product_id:
    params[:product_id]).exists?
  end

  def find_favorite
    @favorite = @product.favorites.find(params[:id])
  end

end
