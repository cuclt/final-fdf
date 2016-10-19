 class RegistrationsController < Devise:: RegistrationsController
  layout "signup_template"

  def sign_up_params
    params.require(:user).permit :name, :email, :chatwork_id, :avatar, :password,
      :password_confirmation
  end
end
