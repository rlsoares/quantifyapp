class Debt < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: {maximum: 50}
  validates :price, presence:true
  validates :description, presence:true
  validates :payday, presence:true
  


end
