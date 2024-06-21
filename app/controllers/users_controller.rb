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
      redirect_to user_path(@user), notice: "Usuário criado com sucesso!!!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index

  end

  private

  def authorize
    redirect_to root_path unless current_user
  end

  def user_params
            params.require(:user).permit(:name, :middle_name, :email, :password)
  end
end
