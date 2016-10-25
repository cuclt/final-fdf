class Admin::OrderDetailsController < ApplicationController
  layout "admin_template"
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :load_order_details, only: :show

  def show
    @order_details = @load_order.order_details
  end

  private
  def load_order_details
    @load_order = Order.find_by id: params[:id]
  end
end
