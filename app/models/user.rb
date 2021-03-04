class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :birth_date
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers', allow_blank: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters', allow_blank: true} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters', allow_blank: true} do
    validates :first_name_kana
    validates :last_name_kana
  end
end
