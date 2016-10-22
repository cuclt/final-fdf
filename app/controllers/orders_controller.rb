class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order, only: :show

  def index
    @orders = current_user.orders.newest.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    if @cart.present?
      @order = Order.new order_params
      if @order.save
        OrderMailer.index(@order, current_user).deliver_later
        Chatwork.send_message @order
        session.delete :cart
        flash[:success] = t "success.orders.successful"
        redirect_to order_path @order
      else
        redirect_to :back
      end
    else
      redirect_to carts_path
    end
  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:address).merge! user: current_user,
      total: @cart.total_price, cart: @cart
  end

  def load_order
    @order = Order.find_by id: params[:id]
    unless @order
      flash[:danger] = t "danger.orders.not_found"
      redirect_to root_path
    end
  end
end
