class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_transactions
  has_many :categories, through: :category_transactions
end
