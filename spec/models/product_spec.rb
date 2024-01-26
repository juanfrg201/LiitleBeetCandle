require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'cerate method' do
  
    it 'returns true with valid product' do
      user = Product.new(name: "Jabon", description: "Es un producto muy bueno", price: 21.21)
      expect(user).to be_valid
    end

    it 'returns true with not valid product' do
      user = Product.new(name: "Jabon", price: 21.21)
      expect(user).to_not be_valid
    end

  end
end
