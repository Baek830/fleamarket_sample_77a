class CommentsController < ApplicationController
  before_action :find_product

  def create
    if Comment.create(comment_params)
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product), alert: "コメントが送信できませんでした"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to product_path(@product), notice: 'コメントを削除しました'
    else
      redirect_to product_path(@product), alert: "削除が失敗しました"
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end


end
