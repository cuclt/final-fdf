class UsersController < ApplicationController
  layout "signup_template"
  before_action :authenticate_user!

  def show
  end
end
