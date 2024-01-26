require 'rails_helper'

RSpec.describe SaleItem, type: :model do
  describe 'cerate method' do
  
    it 'returns true with a valid sale' do
      user = User.new(name: "Juan", last_name: "ruiz", password: "password123", email: "juanfrg20021@gmail.com")
      product1 = Product.create(name: 'Producto 1', description: 'Descripción 1', price: 19.99)
      if user.save 
        sale = user.sales.create(sale_date: DateTime.now)
        sale_item = sale.sale_items.create(product: product1, quantity: 1, subtotal: product1.price)
      end
      expect(sale_item).to be_valid
    end

  end
end
