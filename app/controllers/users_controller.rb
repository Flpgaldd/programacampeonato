require "pry"
class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  def new
    @user = User.new
    if current_user
      redirect_to home_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path(@user), notice: "Usuário criado com sucesso!!!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index

  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.middle_name = params[:user][:middle_name]
    if @user.save
      if params[:user][:image].present?
        @user.image.attach(params[:user][:image])
      end
      redirect_to perfil_path, flash: { success: "Time atualizado com sucesso!!" }
    else
      redirect_to perfil_edit_path(@user.id)
    end
  end

  private

  def authorize
    redirect_to root_path unless current_user
  end

  def user_params
            params.require(:user).permit(:name, :middle_name, :email, :password, :image)
  end
end
