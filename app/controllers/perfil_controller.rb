class PerfilController < ApplicationController
  before_action :authorize


  def usuario
  end

  def edit
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :middle_name, :email, :password, :image)
end

end
