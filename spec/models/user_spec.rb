require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'authenticate method' do
  
    it 'returns true with valid user' do
      user = User.new(name: "Juan", last_name: "ruiz", password: "password123", email: "juanfrg2001@gmail.com")
      expect(user).to be_valid
    end

    it 'returns true with valid password' do
      user = User.new(name: "Juan", last_name: "ruiz", password: "password123", email: "juanfrg2001@gmail.com")
      user.authenticate("password123")
    end

  end
end

