require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :all do
    @user = User.create(name: "Jhon", email: "example@abc.com", password: "sec123", :confirmed_at => DateTime.now)
    @recipe = Recipe.create(name: "paratha", preparation_time: 2, cooking_time: 2, description: 'anything we want', user_id: @user.id)
  end

  after :all do
    @user.destroy
  end

  it "should print the value of Recipe Parameters" do
    expect(@recipe.name).to  eq('paratha')
    expect(@recipe.preparation_time).to  eq(2)
    expect(@recipe.cooking_time).to  eq(2)
    expect(@recipe.description).to  eq('anything we want')
  end

  it "after destroying user recipe should be destryed" do 
    @user.destroy
    expect { @recipe.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end

  
  it "Should have association with user" do 
    expect(@recipe.user_id).to eq(@user.id)
  end

  describe "model recipe validation" do
    
    it 'name should not be null' do
      @recipe.name = ''
      expect(@recipe).not_to be_valid
      @recipe.name = nil
      expect(@recipe).not_to be_valid
    end
    
    it 'description should not be null' do
      @recipe.description = ''
      expect(@recipe).not_to be_valid
      @recipe.description = nil
      expect(@recipe).not_to be_valid
    end
    
    it 'preparation_time should not be null or other than number or less than 0 or greater than 5 ' do
      @recipe.preparation_time = ''
      expect(@recipe).not_to be_valid
      @recipe.preparation_time = nil
      expect(@recipe).not_to be_valid
      @recipe.preparation_time = "5hours"
      expect(@recipe).not_to be_valid
      @recipe.preparation_time = 6
      expect(@recipe).not_to be_valid
      @recipe.preparation_time = 0
      expect(@recipe).not_to be_valid
    end
    
    it 'cooking_time should not be null or other than number or less than 0 or greater than 5 ' do
      @recipe.cooking_time = ''
      expect(@recipe).not_to be_valid
      @recipe.cooking_time = nil
      expect(@recipe).not_to be_valid
      @recipe.cooking_time = "5hours"
      expect(@recipe).not_to be_valid
      @recipe.cooking_time = 6
      expect(@recipe).not_to be_valid
      @recipe.cooking_time = 0
      expect(@recipe).not_to be_valid
    end
  end
end
