class CategoriesController < ApplicationController
  def show
    @category = Category.find_by id: params[:id]
    if @category
      @products = @category.products.newest
    else
      flash[:danger] = t "danger.categories.not_found"
      redirect_to :back
    end
  end
end
