class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  with_options presence: true do
    validates :user
    validates :item
    validates :address
end
