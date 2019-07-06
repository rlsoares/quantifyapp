class User < ApplicationRecord
  has_many :debts, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :official_sheets, dependent: :destroy
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :nome, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true, length:{maximum: 255},
                                    format:{with: VALID_EMAIL_REGEX},
                                    uniqueness:{ case_sensive: true}

end
