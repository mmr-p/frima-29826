class OrdersController < ApplicationController
  before_action :set_item
  
  def index
    @order = CustomerOrder.new
  end

  def create
    @order = CustomerOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :street, :building, :item_id, :tel, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_bd4eacf0caa7f33422cea692"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
