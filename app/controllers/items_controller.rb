class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @items = Item.all.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
    render :new
    end
  end

private

def item_params
  params.require(:item).permit(:content,:image,:name,:explanation,:category_id,:state_id,:delivery_fee_id,:shipment_source_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
end

end