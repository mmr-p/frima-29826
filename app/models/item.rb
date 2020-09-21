class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  has_many :comments
  belongs_to :user
  has_one :customer
  has_one_attached :image

  validates :name, :description, :genre_id, :condition_id, :shipping_fee_info_id, :location_id, :days_to_ship_id, :price, presence: true
  validates :genre_id, :condition_id, :shipping_fee_info_id, :location_id, :days_to_ship_id, numericality: { other_than: 1, mesaage: 'Select'}
  validates :price, numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999, message: 'Out of setting range'}, format: { with: /\A[0-9]+\z/, message: 'Half-width number'}
end
