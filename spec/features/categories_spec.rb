require 'rails_helper'

RSpec.feature "Category Management", type: :feature do
  let(:user) { User.create(name: "John Doe", email: "john@example.com", password: "password") }

  before do
    sign_in(user)
  end

  scenario "User can create a new category" do
    visit new_category_path

    fill_in "Name", with: "Category 1"
    fill_in "Icon", with: "https://example.com/category_icon.png"

    click_button "Create Category"

    expect(page).to have_text("Transactions")
    expect(page).to have_current_path(categories_path)

    expect(page).to have_css("img[src*='https://example.com/category_icon.png'][alt='Category 1'][class='category-image']")
  end

  scenario "User can view category details and transactions" do
    category = Category.create(name: "Category 1", user: user, icon: "https://example.com/category_icon.png")

    visit category_path(category)

    expect(page).to have_text(category.name)
    expect(page).to have_text("0")

    expect(page).to have_css("img[src*='https://example.com/category_icon.png'][alt='Category 1'][class='category-image']")

    click_link "New Transaction"

    expect(page).to have_current_path(new_category_purchase_path(category))

    fill_in "Name", with: "Purchase"
    fill_in "Amount", with: 10
    click_button "Save"

    expect(page).to have_text("Details")
    expect(page).to have_current_path(category_path(category))

    expect(page).to have_text("Purchase")
    expect(page).to have_text("Created at:")
    expect(page).to have_text("10")
  end
end
