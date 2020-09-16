class CategoriesController < ApplicationController
  before_action :set_parents
  before_action :set_category, only: :show

  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        elsif params[:gcchildren_id]
          @parents = Category.where(id: params[:gcchildren_id])
        end
      end
    end
  end

  def show
    @products = @category.set_products
    @products = @products.where(buyer_id: nil).order("created_at DESC")
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

end
