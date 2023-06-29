require 'rails_helper'
# require './spec/support/data_helper.rb'

RSpec.describe 'Myrecipes', type: :system do
  before do
    @user_one = if User.find_by(email: 'Adarsh.pathak@example.com').present?
                  User.find_by(email: 'Adarsh.pathak@example.com')
                else
                  data
                end
  end

  it 'My Recipes Page should have "My Recipes" text and Button to ADD recipe' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'My Recipes'
    expect(page).to have_content('Add')
    expect(page).to have_content('My Recipes')
  end

  it 'My Recipes Page should have "My Recipes" text and Button to ADD recipe' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'My Recipes'
    click_link 'Add Recipe'
    fill_in 'Name', with: 'Pratha'
    fill_in 'Description', with: 'Anything we want'
    fill_in 'Cooking time', with: 2
    fill_in 'Preparation time', with: 2
    click_button 'Create'
    expect(page).to have_content('Pratha')
    expect(page).to have_content('2')
    expect(page).to have_content('Add Ingredient')
    expect(page).to have_content('Generate shopping list')
  end
end
