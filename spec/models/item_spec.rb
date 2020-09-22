require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpg')
    end

    it '全ての情報が正しいフォーマットで入力されていれば出品登録できる' do
      expect(@item).to be_valid
    end

    it '画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がないと出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明がないと出品できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリー情報が選択されていないと出品できない' do
      @item.genre_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Genre Select')
    end

    it '商品の状態についての情報が選択されていないと出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end

    it '配送料の負担についての情報が選択されていないと出品できない' do
      @item.shipping_fee_info_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee info Select')
    end

    it '発送元の地域についての情報が選択されていないと出品できない' do
      @item.location_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Location Select')
    end

    it '発送までの日数についての情報が選択されていないと出品できない' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to ship Select')
    end

    it '価格が記入されていないと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円以下だと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '価格が10,000,000円以上だと出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '販売価格が半角数字で入力されていなければ出品できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
  end
end
