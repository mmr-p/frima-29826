class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :location
  belongs_to :customer

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :street
    validates :tel, length: { maximum: 11 }
  end
end
