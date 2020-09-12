class FavoritesController < ApplicationController
  before_action :find_product
  before_action :find_favorite, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @product.favorites.create(user_id: current_user.id)
      if @product.favorites.save
        respond_to do |format|
          format.json
        end
      else
        flash.now[:alert] = 'いいね出来ませんでした'
      end
    end
    redirect_to product_path(@product)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      if @favorite.destroy
        respond_to do |format|
          format.json
        end
        redirect_to product_path(@product), notice: '出品を削除しました'
      else
        redirect_to product_path(@product), alert: "削除が失敗しました"
      end
    end
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
