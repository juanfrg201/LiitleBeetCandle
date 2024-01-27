class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :require_non_admin, only: [:index]
  before_action :require_admin!, only: [:new, :create]

  def index
    @products = Product.order(created_at: :desc).paginate(page: params[:page], per_page: 15)
    @new_value = params[:new_value].present? ? params[:new_value] : 0
  end

  def new 
    @product = Product.new
  end

  def create 
    product = Product.new(create_params)
    if product.save 
      redirect_to admin_dahsboard_index_path, notice: 'Se agrego el producto'
    else
      redirect_to admin_dahsboard_index_path, error: 'No se pudo agregar el producto'
    end

  end

  private

  def require_non_admin
    redirect_to admin_dahsboard_index_path, alert: 'Accede como usuario' if current_user.has_role?(:admin)
  end

  def create_params 
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
