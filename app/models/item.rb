class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :customer
  has_one_attached :image
end
