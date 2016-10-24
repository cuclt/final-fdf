class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @products = Product.newest.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
    @comments = @product.comments.newest.paginate page: params[:page],
      per_page: Settings.per_page_comment
    @categories = Category.first(Settings.limit_categories)
  end

  private
    def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "could_not_find_the_product"
      redirect_to root_path
    end
  end
end
