require 'rails_helper'

RSpec.describe Food, type: :model do
  before :all do
    @user = User.create(name: "Jhon", email: "example@abc.com", password: "sec123", :confirmed_at => DateTime.now)
    @food = Food.create(name: "apple", measurement_unit: "kilogram", price: 12, quantity: 2, user_id: @user.id )
  end

  after :all do
    @food.destroy
    @user.destroy
  end

  it "should have Food Parameter printed" do
    expect(@food.name).to eq("apple")
    expect(@food.measurement_unit).to eq("kilogram")
    expect(@food.price).to eq(12)
    expect(@food.quantity).to eq(2)
  end

  it "after destroying user food should be destryed" do 
    @user.destroy
    expect { @food.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "Should have association with User" do 
    expect(@food.user_id).to eq(@user.id)
  end

  describe "model food validation" do 
    
    it "name should not be null" do
      @food.name = ''
      expect(@food).not_to be_valid
      @food.name = nil
      expect(@food).not_to be_valid
    end

    it "mesurment uint should not be null" do
      @food.measurement_unit = ''
      expect(@food).not_to be_valid
      @food.measurement_unit = nil
      expect(@food).not_to be_valid
    end

    it "price should not be null or <= 0 or other than numeric value" do
      @food.price = ''
      expect(@food).not_to be_valid
      @food.price = nil
      expect(@food).not_to be_valid
      @food.price = -5
      expect(@food).not_to be_valid
      @food.price = 0
      expect(@food).not_to be_valid
    end

    it "quantity should not be null or <= 0 or other than integer" do
      @food.quantity = ''
      expect(@food).not_to be_valid
      @food.quantity = nil
      expect(@food).not_to be_valid
      @food.quantity = -5
      expect(@food).not_to be_valid
      @food.quantity = 0
      expect(@food).not_to be_valid
      @food.quantity = 5.5
      expect(@food).not_to be_valid
    end
  end
end
