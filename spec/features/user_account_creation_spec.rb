require 'rails_helper'

feature 'user creates account' do 
  scenario 'with valid attributes' do
    visit new_user_path
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Username", with: "JS12"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("Welcome, John!")
  end

  scenario 'with no first name' do
    visit new_user_path
    fill_in "Last name", with: "Smith"
    fill_in "Username", with: "JS12"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("First name can't be blank")
  end

  scenario 'with no last name' do
    visit new_user_path
    fill_in "First name", with: "John"
    fill_in "Username", with: "JS12"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("Last name can't be blank")
  end

  scenario 'with no password' do
    visit new_user_path
    fill_in "Last name", with: "Smith"
    fill_in "Username", with: "JS12"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'with no password confirmation' do
    visit new_user_path
    fill_in "Last name", with: "Smith"
    fill_in "Username", with: "JS12"
    fill_in "Password", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
