class CategoryTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :transactions, class_name: 'Transaction'
end
