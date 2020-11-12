class PurchasesController < ApplicationController
  def index
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
    params.require(:purchase_address).permit(:item_id, :post_num, :prefectures_id, :city, :address_num, :building_name, :phone_num).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      # amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end

