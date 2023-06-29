require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  before do
    @user_one = if User.find_by(email: 'Adarsh.pathak@example.com').present?
                  User.find_by(email: 'Adarsh.pathak@example.com')
                else
                  User.create(name: 'Adarsh Pathak', email: 'Adarsh.pathak@example.com', password: '123456',
                              confirmed_at: DateTime.now)
                end
  end

  it 'should have "Food List" and ADD button' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'Food List'
    expect(page).to have_content('Food List')
    expect(page).to have_content('Add Food')
  end

  it 'should have "Food List" and ADD button' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'Food List'
    click_link 'Add Food'
    expect(page).to have_content('Add Food')
    fill_in 'Name', with: 'grains'
    page.select 'Kilograms', from: 'Measurement unit'
    fill_in 'Price', with: 2
    fill_in 'Quantity', with: 2
    click_button 'Add Food'
    expect(page).to have_content('grains')
  end

  it 'should have "Food List" and ADD button' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'Food List'
    click_link 'Add Food'
    expect(page).to have_content('Add Food')
    fill_in 'Name', with: 'grains'
    page.select 'Kilograms', from: 'Measurement unit'
    fill_in 'Price', with: 2
    fill_in 'Quantity', with: 2
    click_button 'Add Food'
    expect(page).to have_content('grains')
    click_link 'Update'
    expect(page).to have_content('Edit Food')
  end
end
