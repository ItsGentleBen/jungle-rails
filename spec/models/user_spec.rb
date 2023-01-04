require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create( 
      last_name: "Stoll",
      first_name: "Jenna",
      email: "JenS@cad.ca",
      password: "123456",
      password_confirmation: "123456"
    )
  end
  
  describe "Validations" do

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  
    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  
    it 'is not valid without a password' do
      @user.password_digest = nil
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do

    it 'is valid with the valid credentials' do
      subject.save
      @user = User.authenticate_with_credentials('jens@cad.ca', '123456')
      expect(@user).to_not be_nil
    end

    it 'is not valid without valid email' do
      subject.save
      @user = User.authenticate_with_credentials('jens1@cad.ca', '123456')
      expect(@user).to be_nil
    end

    it 'is not valid without valid password' do
      subject.save
      @user = User.authenticate_with_credentials('jens@cad.ca', '1234567')
      expect(@user).to be_nil
    end

    it 'is valid without valid email with spaces around it' do
      subject.save
      @user = User.authenticate_with_credentials(' jens@cad.ca ', '123456')
      expect(@user).to_not be_nil
    end

    it 'is valid without valid email with wrong case' do
      subject.save
      @user = User.authenticate_with_credentials('jENs@cad.ca', '123456')
      expect(@user).to_not be_nil
    end
  end
end