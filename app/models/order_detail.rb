class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order, dependent: :destroy

  def total_price
    product.price * quantity
  end
end
