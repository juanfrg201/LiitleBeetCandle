class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update]
  
  def new
    @user = User.new
  end

  def create
    if !User.find_by(email: user_params[:email])
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to products_path
      else
        flash[:error] = 'El usuario no se pudo registrar valide todos los campos'
        redirect_to root_path
      end
    else
      session[:user_id] = nil
      flash[:error] = 'Usuario ya registrado'
      redirect_to root_path
    end
  end

  def update 
    if @user.update(user_params)
      flash[:notice] = 'Perfil actualizado con éxito.'
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def set_user 
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :last_name, :email,:password)
  end
end
