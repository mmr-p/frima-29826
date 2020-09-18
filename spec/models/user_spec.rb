require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネームが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが重複していては登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスに@が含まれていない場合は登録できない' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが6文字未満だと登録できない' do
      @user.password = '0000a'
      @user.password_confirmation = '00000a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは半角英数字混合でなければ登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'パスワードがあっても確認用パスワードが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名の苗字欄があっても名前欄が空では登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザー本名の名前欄があっても苗字欄が空では登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'ユーザー本名が全角ではないときは登録できない' do
      @user.last_name = 'aaaaa'
      @user.first_name = 'bbbbb'
      @user.valid?
      expect(@user.errors.full_messages).to include(
        'Last name Full-width characters', 'First name Full-width characters'
      )
    end

    it 'ユーザー本名の苗字欄（フリガナ）があっても名前欄（フリガナ）が空では登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'ユーザー本名の名前欄（フリガナ）があっても苗字欄（フリガナ）が空では登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'ユーザー本名のフリガナが全角カタカナではないときは登録できない' do
      @user.last_name_kana = 'aaaaa'
      @user.first_name_kana = 'bbbbb'
      @user.valid?
      expect(@user.errors.full_messages).to include(
        'Last name kana Full-width katakana characters', 'First name kana Full-width katakana characters'
      )
    end

    it '生年月日が空では登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
