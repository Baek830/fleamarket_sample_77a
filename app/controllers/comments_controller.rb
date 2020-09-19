class CommentsController < ApplicationController
  before_action :find_product

  def create
    Comment.create(comment_params)
    redirect_to product_path(@product)
  end

  def destroy
    @comment = Comment.find_by(product_id: @product.id)
    if @comment.destroy
      redirect_to product_path(@product), notice: 'コメントを削除しました'
    else
      redirect_to product_path(@product), alert: "削除が失敗しました"
    end

  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end


end
