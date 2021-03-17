class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_order, only: [:index, :create]

  def index
    if Order.exists?(item_id: params[:item_id])
      redirect_to root_path
    end
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(user_id: current_user.id, item_id: params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_order
    if current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end
  def order_params
    params.require(:order_address).permit(:postal_code, :prefectures_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

end
