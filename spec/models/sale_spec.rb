require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe 'cerate method' do
  
    it 'returns true with a valid sale' do
      user = User.new(name: "Juan", last_name: "ruiz", password: "password123", email: "juanfrg2001@gmail.com")
      if user.save 
        sale = user.sales.create(sale_date: DateTime.now)
      end
      expect(sale).to be_valid
    end

    it 'returns true with a not valid sale without user' do
      sale = Sale.new(sale_date: Date.today)
      expect(sale).to_not be_valid
    end

  end
end
