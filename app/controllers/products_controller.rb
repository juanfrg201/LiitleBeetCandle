class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 15)
    @new_value = params[:new_value].present? ? params[:new_value] : 0
    
  end
end
