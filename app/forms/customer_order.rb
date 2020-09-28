class CustomerOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :tel, :item_id, :user_id, :token

  # addressのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :street
    validates :tel, length: { maximum: 11 }
    validates :token
  end

  def save
    customer = Customer.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                   street: street, building: building, tel: tel, customer_id: customer.id)
  end
end
