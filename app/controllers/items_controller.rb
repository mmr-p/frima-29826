class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      render :index
    end
  end

  def create
    Item.create(item_params)
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

  params.require(:item).permit(:name, :description, :genre, :condition, :shipping_fee_info, :location, :days_to_ship, :price)
end
