class StaticPagesController < ApplicationController
  def home
    @product_new = Product.last
    @top_products = Product.newest.limit_item
      .offset Settings.home.offset_top_product
    @special_products = Product.newest.limit_item
      .offset Settings.home.offset_special_product
  end
end
