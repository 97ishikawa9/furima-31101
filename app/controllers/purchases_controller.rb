class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  def index
    if @item.user.id == current_user.id || @item.purchase != nil
      redirect_to root_path
    end
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
      if @purchase_address.valid?
        pay_item
        @purchase_address.save
        redirect_to root_path
      else
        render 'index'
      end
  end

  private
  
  def purchase_params
    params.require(:purchase_address).permit(:post_num, :prefectures_id, :city, :address_num, :building_name, :phone_num).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end

