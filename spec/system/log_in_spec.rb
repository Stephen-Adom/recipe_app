require 'rails_helper'

RSpec.describe '/users/', type: :system do
  before do
    @user_one = if User.find_by(email: 'Adarsh.pathak@example.com').present?
                  User.find_by(email: 'Adarsh.pathak@example.com')
                else
                  User.create(name: 'Adarsh Pathak', email: 'Adarsh.pathak@example.com', password: '123456',
                              confirmed_at: DateTime.now)
                end
  end

  it 'User can log in the page' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    expect(page).to have_content 'Signed in successfully.'
  end
end
