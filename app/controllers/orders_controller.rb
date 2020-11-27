class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set, only: [:index, :create]
  before_action :order_set, only: :index

  def index
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :add_pref_id, :add_muni, :add_local, :add_house, :phone_num, :order_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def order_set
    @user_order = UserOrder.new
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
