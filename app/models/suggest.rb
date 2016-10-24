class Suggest < ApplicationRecord
  belongs_to :user

  mount_uploader :image, PictureUploader

  validates :name, presence: true, length: {maximum: 50}
  validates :user, presence: true
end
