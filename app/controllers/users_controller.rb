class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @sale_item = Product.where(seller_id: current_user.id)
  end

  def logout
  end
  
end
