class SuggestsController < ApplicationController
  layout "signup_template"
  before_action :authenticate_user!
  def new
    @suggest = Suggest.new
  end

  def create
    @suggest = Suggest.new product_suggest_params
    @suggest.user_id = current_user.id
    if @suggest.save
      flash[:success] = t "success.suggests.successful"
      redirect_to root_path
    else
      flash[:danger] = t "danger.suggests.fails"
      render :new
    end
  end

  private
  def product_suggest_params
    params.require(:suggest).permit :name, :image, :description
  end
end
