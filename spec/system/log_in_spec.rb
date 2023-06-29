require 'rails_helper'

RSpec.describe '/users/', type: :system do
  before do
    if User.find_by(email: 'Adarsh.pathak@example.com').present?
      @user_one = User.find_by(email: 'Adarsh.pathak@example.com')
    else
      @user_one = User.create(name: "Adarsh Pathak", email: 'Adarsh.pathak@example.com', password: '123456', confirmed_at: DateTime.now)
    end
  end

  it "User can log in the page" do 
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    expect(page).to have_content 'Signed in successfully.'
  end
end
