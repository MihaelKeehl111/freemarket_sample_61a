class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  validates :email, presence: true, null: false, uniqueness: true, on: :validates_step1
  validates :nickname, presence: true, null: false, length: { maximum: 20 }, on: :validates_step1
  validates :familyname, presence: true, null: false, on: :validates_step3
  validates :familyname_kana, presence: true, null: false, on: :validates_step3
  validates :firstname, presence: true, null: false, on: :validates_step3
  validates :firstname_kana, presence: true, null: false, on: :validates_step3
  validates :birthday, presence: true, null: false, on: :validates_step3
  validates :cellphone, presence: true, null: false, on: :validates_step2

  has_one :address
  accepts_nested_attributes_for :address
  has_one :card
  accepts_nested_attributes_for :card
  
  def password_complexity
    return if password.blank? || password =~ /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,70}+\z/i
    errors.add :password, "７文字以上の英数混在で入力してください。"
  end

end
