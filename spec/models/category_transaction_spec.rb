require 'rails_helper'

RSpec.describe CategoryTransaction, type: :model do
  it 'is valid with valid attributes' do
    category = Category.create(name: 'Category 1')
    purchase = Purchase.create(name: 'Purchase 1')
    category_transaction = CategoryTransaction.new(category:, purchase:)
    expect(category_transaction).to be_valid
  end
end
