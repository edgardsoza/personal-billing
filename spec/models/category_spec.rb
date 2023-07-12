require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'test@example.com', password: 'password', name: 'John Doe')
    category = Category.new(name: 'Category 1', user:)
    expect(category).to be_valid
  end

  it 'is not valid without a user' do
    category = Category.new(name: 'Category 1')
    expect(category).not_to be_valid
    expect(category.errors[:user]).to include('must exist')
  end
end
