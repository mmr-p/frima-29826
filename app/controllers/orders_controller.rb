class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_index

  def index
    if current_user.id == @item.user_id || @item.customer.present?
      redirect_to root_path
    else
      @order = CustomerOrder.new
    end
  end

  def create
    @order = CustomerOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :street, :building, :item_id, :tel, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
