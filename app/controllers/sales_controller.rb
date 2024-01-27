class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:new]
  before_action :set_product, only: [:show]


  def new 
    @total_cost = @products.sum { |product_info| product_info[:product].price * product_info[:quantity] }
    @product_info = @products.map { |product_info| [product_info[:product].id,  product_info[:quantity]] }
    
  end

  def create
    sale = Services::Sale.new(current_user, JSON.parse(params[:products]))
    if sale.perform.present?
      flash[:notice] = 'Se genero el registro de venta'
      redirect_to sale_path(sale.instance_variable_get(:@sale).id)
    else
      flash[:error] = 'Error al generar el registro'
      redirect_to root_path
    end
  end

  def show 
    @sale_items = @sale.sale_items
  end

  private 

  def set_products
    # Supongo que selected_ids_and_quantities tiene el formato "id1:quantity1,id2:quantity2,..."
    # Dividimos por comas y luego por dos puntos para obtener un array de arrays
    products_arr = params[:selected_ids_and_quantities].split(",").map { |pair| pair.split(":") }

    # Utilizamos map para buscar los productos y las cantidades
    @products = products_arr.map do |product_id, quantity|
      product = Product.find(product_id)
      { product: product, quantity: quantity.to_i } # Convertimos la cantidad a entero
    end
  end

  def set_product 
    @sale = Sale.find(params[:id])
  end
end
