class UsersController < ApplicationController
  before_action :move_to_products_index, only: [:show, :edit, :logout]

  def show
    @user = User.find(params[:id])
    @sale_item = Product.where(seller_id: current_user.id)
  end

  def edit
  end

  def update
  end

  def logout
  end

  def move_to_products_index
    redirect_to root_path unless user_signed_in?
  end
  
end
