require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    before(:each) do
      @category = Category.new
      @product = Product.new( 
        name: "Lily of the Valley",
        price: 100,
        quantity: 50,
        category: @category
      )
    end

    it 'is valid with valid attributes' do
      expect(@product.validate).to be true
      expect(@product.valid?).to be true
      expect(@product).to be_valid
      expect(@product.errors.full_messages.any?).to be false
    end
  
    it 'is not valid without a name' do
      @product.name = ''
      expect(@product.validate).to be false
      expect(@product.valid?).to be false
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include ("Name can't be blank")
      expect(@product.errors.full_messages[0]).to include ("can't be blank")
      expect(@product.errors.full_messages.any?).to be true
    end

    it 'is not valid without a price' do
      @product.price = :blank
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Price is not a number")
    end
   
    it 'is not valid when quantity is blank' do
      @product.quantity = :blank
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product.category = nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Category must exist")
    end
  end
end