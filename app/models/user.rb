class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :comments
  has_many :suggests

  enum role: {admin: 0, user: 1}

  mount_uploader :avatar, PictureUploader
end
