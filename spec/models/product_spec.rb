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
    

    it "tests that saved sucessfully without price" do

      @category = Category.new
      @category.id = 4
      @category.name = 'Misc'
      
      @product = Product.new
      @product.name = "Misc product"
      @product.price = nil
      @product.quantity = 999
      @product.category_id = @category

      @category.products = [@product]
      @product.save
      
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    
    it "tests that saved sucessfully without quantity" do

      @category = Category.new
      @category.id = 4
      @category.name = 'Misc'
      
      @product = Product.new
      @product.name = "Misc product"
      @product.price = 999
      @product.quantity = nil
      @product.category_id = @category

      @category.products = [@product]
      @product.save
      
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end


    it "tests that saved sucessfully without category" do

      @category = Category.new
      @category.id = 4
      @category.name = 'Misc'
      
      @product = Product.new
      @product.name = "Misc product"
      @product.price = 999
      @product.quantity = 999
      @product.category_id = nil

      @category = [@product]
      @product.save
      
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
