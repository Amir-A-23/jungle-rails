require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    # validation tests/examples here
    it "tests that all fields are saved sucessfully" do

      @category = Category.new
      @category.id = 4
      @category.name = 'Misc'
      
      @product = Product.new
      @product.name = "Misc product"
      @product.price = 999
      @product.quantity = 999
      @product.category_id = @category

      @category.products = [@product]
      @product.save
      
      expect(@product).to be_valid
    end


    it "tests that saved sucessfully without name" do

      @category = Category.new
      @category.id = 4
      @category.name = 'Misc'
      
      @product = Product.new
      @product.name = nil
      @product.price = 999
      @product.quantity = 999
      @product.category_id = @category

      @category.products = [@product]
      @product.save
      
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    

  end
end
