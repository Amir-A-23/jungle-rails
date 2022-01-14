require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is valid with all user parameters filled" do
      @user = User.create(first_name: 'Amir',
        last_name: 'Ali',
        email: 'abc@123.com',
        password: '12345',
        password_confirmation: '12345')

      expect(@user).to be_valid
    end

    it "is not valid when first name is nil" do
      @user = User.create(first_name: nil,
        last_name: "Ali",
        email: "abc@123.com",
        password: "12345",
        password_confirmation: "12345")

      
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid when last name is nil" do
      @user = User.create(first_name: "Amir",
        last_name: nil,
        email: "abc@123.com",
        password: "12345",
        password_confirmation: "12345")

      
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid when email is nil" do
      @user = User.create(first_name: "Amir",
        last_name: "Ali",
        email: nil,
        password: "12345",
        password_confirmation: "12345")

      
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "is not valid when password is nil" do
      @user = User.create(first_name: "Amir",
        last_name: "Ali",
        email: "abc@123.com",
        password: nil,
        password_confirmation: "12345")

      
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid when password confirmation is nil" do
      @user = User.create(first_name: "Amir",
        last_name: "Ali",
        email: "abc@123.com",
        password: "12345",
        password_confirmation: nil)

      
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "is not valid when email is already registered" do
      @user_one = User.create(first_name: "Amir",
        last_name: "Ali",
        email: "abc@123.com",
        password: "12345",
        password_confirmation: "12345")

      @user_two = User.create(first_name: "Malcolm",
        last_name: "Merchant",
        email: "abc@123.com",
        password: "12345",
        password_confirmation: "12345")  

        expect(@user_one).to be_valid
        expect(@user_two).to be_invalid
        expect(@user_two.errors.full_messages).to include("Email has already been taken")
    end

    context "verifying password inputs" do
      it "is invalid if password and password confirmation do not match" do
        @user = User.create(first_name: "Amir",
          last_name: "Ali",
          email: "abc@123.com",
          password: "12345",
          password_confirmation: "ABCDE")
      
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "is invalid if password has less than 5 characters" do
        @user = User.create(first_name: "Amir",
          last_name: "Ali",
          email: "abc@123.com",
          password: "123",
          password_confirmation: "123")

          expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
      end
    end


  end
end
