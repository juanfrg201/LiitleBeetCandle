class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.has_role?(:admin)
        redirect_to admin_dahsboard_index_path, notice: 'Inicio de sesión exitoso. Admin'
      else
        redirect_to user_dashboard_index_path, notice: 'Inicio de sesión exitoso.'
      end
      
    else
      flash[:error] = 'Usuario no encontrado, por favor registrate'
      redirect_to root_path
    end
  end

  def destroy
    user = User.find(params[:id])
    session[:user_id] = nil
    redirect_to root_path, notice: 'Se cerro sesion correctamente'
  end

  private

  def redirect_if_logged_in
    redirect_to user_dashboard_index_path if current_user
  end
end
