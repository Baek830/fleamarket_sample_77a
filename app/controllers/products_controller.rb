class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:new, :edit]

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: '出品しました'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: '更新しました'
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice: '出品を削除しました'
  end



  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :brand, :condition_id, :shipping_cost_id, :shipment_date_id, :prefecture_id, :category_id, :buyer_id, :seller_id)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
