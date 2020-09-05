class CategoriesController < ApplicationController
  before_action :set_parents

  def search
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def set_parents
    @parents = Category.where(ancestry: nill)
  end

end
