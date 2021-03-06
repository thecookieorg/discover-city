class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :profile_pic, :password, :password_confirmation, :current_password, :age, :bio, :gender)
  end
end