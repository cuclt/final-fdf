class SearchesController < ApplicationController
  def index
    @products = Product.search(params[:search]).newest
  end
end
