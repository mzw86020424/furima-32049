class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set
  before_action :send_to_root

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:addresses, :building, :phone, :postal_code, :city, :prefecture_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id, price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def send_to_root
    redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end

  def item_set
    @item = Item.find(params[:item_id])
  end
end
