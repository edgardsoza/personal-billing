RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'password', name: 'John Doe')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
