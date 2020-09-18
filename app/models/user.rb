class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 空白を認めない
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
  # 全角ひらがな、全角カタカナ、漢字 のみ許可
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  # 全角カタカナ のみ許可
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
end
