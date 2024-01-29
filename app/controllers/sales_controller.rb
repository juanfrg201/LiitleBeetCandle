class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:new]
  before_action :set_product, only: [:show]


  def new 
    @total_cost = @products.sum { |product_info| product_info[:product].price * product_info[:quantity] }
    @product_info = @products.map { |product_info| [product_info[:product].id,  product_info[:quantity]] }
  end

  def create
    products = JSON.parse(params[:products])
    if !products.empty?
      sale = Services::Sale.new(current_user, JSON.parse(params[:products]))
      if sale.perform.present?
        flash[:notice] = 'Se genero el registro de venta'
        redirect_to sale_path(sale.instance_variable_get(:@sale).id)
      else
        flash[:error] = 'Error al generar el registro'
        redirect_to products_path
      end
    else
      flash[:error] = 'Error al generar el registro de vewnta , agrega productos'
      redirect_to products_path
    end
  end

  def show 
    @sale_items = @sale.sale_items
  end

  private 

  def set_products
   
    products_arr = params[:selected_ids_and_quantities].split(",").map { |pair| pair.split(":") }
    @products = products_arr.map do |product_id, quantity|
      product = Product.find(product_id)
      { product: product, quantity: quantity.to_i } 
    end
  end

  def set_product 
    @sale = Sale.find(params[:id])
  end
end
