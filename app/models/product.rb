class Product < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :order_details
  has_many :orders, through: :order_details

  scope :newest, ->{order created_at: :desc}
  scope :limit_item, ->{limit Settings.home.limit_product}
  scope :search, ->search do
    where "LOWER(name) LIKE ?", "%#{search.downcase}%" if search.present?
  end

  mount_uploader :image, PictureUploader

  ratyrate_rateable "rate"
end
