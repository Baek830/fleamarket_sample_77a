class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @product = Product.all.order("created_at DESC").limit(10)
    @brand = Product.where(brand: 'ロレックス').order("created_at DESC").limit(10)
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: '出品しました'
    else
      render 'new', notice: '出品に失敗しました'
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
    @product = Product.includes(:images).find(params[:id])
    @condition = Condition.find(@product.condition_id)
    @shipping_cost = ShippingCost.find(@product.shipping_cost_id)
    @prefecture = Prefecture.find(@product.prefecture_id)
    @shipment_date = ShipmentDate.find(@product.shipment_date_id)
  end

  def destroy
    @product = Product.includes(:images).find(params[:id])
    @product.destroy
    redirect_to root_path, notice: '出品を削除しました'
  end

  private
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price, 
      :brand,
      :condition_id, 
      :shipping_cost_id, 
      :shipment_date_id, 
      :prefecture_id, 
      :category_id, 
      images_attributes: [:image, :_destroy, :id]
      )
      .merge(seller_id: current_user.id)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
