class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transactions
  has_many :purchases, through: :category_transactions
end
