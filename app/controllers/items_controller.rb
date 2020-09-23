class ItemsController < ApplicationController
  before_action :set_item, only: :show

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      render :index
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :description, :genre_id, :condition_id, :shipping_fee_info_id, :location_id, :days_to_ship_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
