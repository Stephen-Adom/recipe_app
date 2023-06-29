require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = User.create(name: 'Jhon', email: 'example@abc.com', password: 'sec123', confirmed_at: DateTime.now)
  end

  after :all do
    @user.destroy
  end

  it "should give the name of user variable's value" do
    expect(@user.name).to eq('Jhon')
    expect(@user.email).to eq('example@abc.com')
  end

  it 'name should not be less than 6 char' do
    @user.email = 123
    expect(@user).not_to be_valid
  end

  describe 'validation user' do
    it 'name should not be empty' do
      @user.name = ''
      expect(@user).not_to be_valid
    end

    it 'name should not be nil' do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'email should not be empty' do
      @user.email = ''
      expect(@user).not_to be_valid
    end

    it 'name should not be nil' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'name should not be less than 6 char' do
      @user.email = 123
      expect(@user).not_to be_valid
    end
  end
end
