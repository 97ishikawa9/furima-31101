class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
  end

  private

  def message_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :send_price_id, :prefectures_id, :sending_days_id, :price).merge(user_id: current_user.id)
  end
end
