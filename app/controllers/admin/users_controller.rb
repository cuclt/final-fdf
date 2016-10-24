class Admin::UsersController < ApplicationController
  layout "admin_template"
  before_action :authenticate_user!
  before_action :verify_admin

  def index
    @users = User.all
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user.destroy
      flash[:success] = t "success.users.user_del"
    else
      flash[:danger] = t "danger.users.user_del_fail"
    end
    redirect_to admin_users_path
  end
end
