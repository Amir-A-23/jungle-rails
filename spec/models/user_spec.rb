require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is valid with all user parameters" do
      @user = User.create(first_name: 'Amir',
        last_name: 'Ali',
        email: 'abc@123.com',
        password: '123',
        password_confirmation: '123')

      expect(@user).to be_valid
    end

  end
end
