class UserDashboardController < ApplicationController
  def index
    @products = Product.select('products.*, COUNT(sale_items.id) AS sale_count').joins(:sale_items).group('products.id').order('sale_count DESC').first(3)
    @sales = Sale.all.order(sale_date: :desc)
  end
end
