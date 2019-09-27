class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@users = User.all
    @users = @users.search(params[:search])
    @users = @users.where(["status = ?", "#{params[:status]}"]) if params[:status].present?
    @users = @users.reorder("#{params[:key]} #{params[:direction]}") if params[:key].present?
  end

  def show
  	@user = User.find(params[:id])
  end

  def quit
  	@user = User.find(params[:id])
  	@user.status = "強制退会"
  	@user.save
    redirect_to admins_user_path(@user)
  end

  private
  def user_params
 	params.require(:user).permit(:id, :email, :last_name, :first_name, :status)
  end
end
