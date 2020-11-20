class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :search_item, only: [:index, :search]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
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
  end

  def edit
    if current_user.id != @item.user_id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != @item.user_id || @item.purchase != nil
      redirect_to root_path
    end
    @item.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result.includes(:category)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :send_price_id, :prefectures_id, :sending_days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @p = Item.ransack(params[:q])
  end
end
