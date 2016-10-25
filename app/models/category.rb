class Category < ApplicationRecord
  has_many :products

  scope :newest, ->{order created_at: :desc}
  scope :active, ->{where "status = ?", true}
end
