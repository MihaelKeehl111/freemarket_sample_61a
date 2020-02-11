class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validate :password_complexity
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :familyname, presence: true
  validates :familyname_kana, presence: true, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :firstname, presence: true
  validates :firstname_kana, presence: true, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :birthday, presence: true
  validates :cellphone, presence: true

  has_one :address
  accepts_nested_attributes_for :address
  has_one :card
  accepts_nested_attributes_for :card
  
  def password_complexity
    return if password.blank? || password =~ /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,70}+\z/i
    errors.add :password, "７文字以上の英数混在で入力してください。"
  end

end
