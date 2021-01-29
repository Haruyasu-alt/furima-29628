class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end


   def update
    if @item.update(item_params)
      redirect_to action: :show
     else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

private

def item_params
  params.require(:item).permit(:content,:image,:name,:explanation,:category_id,:state_id,:delivery_fee_id,:shipment_source_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end


end