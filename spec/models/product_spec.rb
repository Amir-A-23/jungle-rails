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

    

  end
end
