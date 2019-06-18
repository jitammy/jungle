require 'rails_helper'

 RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.create(name:"category")
      @product = Product.new
      @product.name = "something"
      @product.price = 2000
      @product.quantity = 2000
      @product.category_id = @category.id
      @product.valid?
    end

     it 'should create a product' do
      expect(@product).to be_valid
    end

     it 'shouldnt have an empty name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages[0]).to include(@product.errors[:name][0])

    end

     it 'shouldnt have an empty price' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages[0]).to include(@product.errors[:price][0])


    end

     it 'shouldnt have an empty quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages[0]).to include(@product.errors[:quantity][0])


    end

     it 'shouldnt have an empty category' do
      @product.category_id = nil
      @product.save
      expect(@product.errors.full_messages[0]).to include(@product.errors[:category][0])


    end

   end
end 