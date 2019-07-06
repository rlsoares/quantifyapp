class Income < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: {maximum: 50}
  validates :value, presence:true
  validates :date, presence:true




end
