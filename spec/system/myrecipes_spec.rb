require 'rails_helper' 
RSpec.describe 'Myrecipes', type: :system do
  before do
    data
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

  it "Ingredients can be added in Recipe" do 
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'My Recipes'
    click_link 'Dosa'
    click_link 'Add Ingredient'
    expect(page).to have_content('Add Food To Recipe')
    page.select "apple", from: "Food"
    fill_in 'Quantity', with: 4
    click_button 'Add Food To Recipe'
    expect(page).to have_content('apple')
    expect(page).to have_content(4)
  end

  it "should genrate the shoping list" do 
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'My Recipes'
    click_link 'juice'
    click_link 'Generate shopping list'
    expect(page).to have_content('orange')
  end

  it "Public Recipe should be visible" do 
    visit root_path
    fill_in 'Email', with: 'Stephen.Adom@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    expect(page).to have_content('juice')
    expect(page).to have_content('Adarsh')
    expect(page).to have_content('Dosa')
    expect(page).to have_content('Icecream')
    expect(page).to have_content('Stephen')
  end

  it "User Can make Recipe Public" do 
    visit root_path
    fill_in 'Email', with: 'Stephen.Adom@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'My Recipes'
    click_link 'soda'
    page.check('Public')
    click_link 'All Recipes'
    expect(page).to have_content('Stephen')
  end

  it "User can remove Own Recipe" do
    visit root_path
    fill_in 'Email', with: 'Stephen.Adom@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    click_link 'My Recipes'
    first('button', text: 'Remove').click
    expect(page).to have_content('Recipe was successfully destroyed.')
  end
end
