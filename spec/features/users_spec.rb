require 'spec_helper'

RSpec.feature 'User Management', type: :feature do
  scenario 'User can sign up' do
    visit sign_up_path

    fill_in 'Full name', with: 'John Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'

    click_button 'Sign Up'

    expect(page).to have_text('LOGIN')
    expect(page).to have_current_path(log_in_path)
  end

  scenario 'User can log in and log out' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')

    visit log_in_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'

    click_button 'Log In'

    expect(page).to have_text('TRANSACTIONS')
    expect(page).to have_current_path(categories_path)
  end
end
