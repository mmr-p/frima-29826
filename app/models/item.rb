class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_info
  belongs_to_active_hash :location
  belongs_to_active_hash :days_to_ship
  has_many :comments
  belongs_to :user
  has_one :customer
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :genre_id
    validates :condition_id
    validates :shipping_fee_info_id
    validates :location_id
    validates :days_to_ship_id
    validates :price
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :genre_id
    validates :condition_id
    validates :shipping_fee_info_id
    validates :location_id
    validates :days_to_ship_id
  end

  num = /\A[0-9]+\z/
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' },
            format: { with: num, message: 'Half-width number' }
end
