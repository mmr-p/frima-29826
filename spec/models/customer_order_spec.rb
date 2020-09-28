require 'rails_helper'

RSpec.describe CustomerOrder, type: :model do
  describe '商品購入' do
    before do
      @customer_order = FactoryBot.build(:customer_order)
    end

    it '全ての情報が正しいフォーマットで入力されていれば購入できる' do
      expect(@customer_order).to be_valid
    end

    it '郵便番号がなければ購入できない' do
      @customer_order.postal_code = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県を選択していなければ購入できない' do
      @customer_order.prefecture_id = 1
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include('Prefecture Select')
    end

    it '都道府県がnilだと購入できない' do
      @customer_order.prefecture_id = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include('Prefecture Select')
    end

    it '市区町村がなければ購入できない' do
      @customer_order.city = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("City can't be blank")
    end

    it '番地がなければ購入できない' do
      @customer_order.street = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Street can't be blank")
    end

    it '電話番号がなければ購入できない' do
      @customer_order.tel = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Tel can't be blank")
    end

    it '郵便番号にハイフンがなければ購入できない' do
      @customer_order.postal_code = '1234567'
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include('Postal code Input correctly')
    end

    it '電話番号は１１桁以内でなければ購入できない' do
      @customer_order.tel = '111111111111'
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include('Tel is too long (maximum is 11 characters)')
    end

    it 'トークンがなければ購入できない' do
      @customer_order.token = nil
      @customer_order.valid?
      expect(@customer_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
