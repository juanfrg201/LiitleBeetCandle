class ApplicationController < ActionController::Base
  helper_method :current_user
  
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to root_path unless current_user
  end

  def require_admin!
    redirect_to admin_dahsboard_index_path, alert: 'Acceso denegado' unless current_user && current_user.has_role?(:admin)
  end
end
