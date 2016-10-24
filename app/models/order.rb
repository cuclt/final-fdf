class Order < ApplicationRecord
  attr_accessor :cart

  belongs_to :user, dependent: :destroy
  has_many :order_details
  has_many :products, through: :order_details
  enum status: {open: 1, close: 0}
  validates :address, presence: true, length: {maximum: 50}

  after_save :build_order_details

  scope :newest, ->{order created_at: :desc}

  private
  def build_order_details
    cart.items.each do |item|
      order_details.create product_id: item.product_id, quantity: item.quantity
    end
  end
end
