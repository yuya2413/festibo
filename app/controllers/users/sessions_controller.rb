# frozen_string_literal: true

class Users::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
    user = User.find_by(email: params[:user][:email])
    if user.status == "退会済み"
      flash[:danger] = "退会済みアカウントです"
      redirect_to root_path and return
    elsif user.status == "強制退会"
      flash[:danger] = "強制退会済みアカウントです"
      redirect_to root_path and return
    end
    super
   end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
