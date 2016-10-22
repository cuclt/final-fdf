class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :create_cart
  before_action :load_category

  private
  def create_cart
    @cart = Cart.build_cart session
  end

  def load_category
    @categories = Category.all
  end
end
