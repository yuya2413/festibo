class Users::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user
  #def edit
  #end

  def show
  	@user = User.find(params[:id])
    #@reservations = @user.reservations
  end

  #def withdraw
  #end

  def quit
  	user = User.find(params[:id])
  	user.status = "退会済み"
  	user.save
    redirect_to users_logout_path
  end

  private
  def user_params
 	params.require(:user).permit(:id, :email, :last_name, :first_name, :status)
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:danger] = "アクセス権がありません"
      redirect_to root_path
    end
  end
end
