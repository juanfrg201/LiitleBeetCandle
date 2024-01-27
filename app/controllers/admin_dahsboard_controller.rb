class AdminDahsboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :require_admin!

  def index
    @products = Product.all 
    @users = User.all 
    @sales = Sale.all
  end
end
