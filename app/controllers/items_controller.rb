class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
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
  end

  def show
    
  end

  private

  def item_params
    params.require(:item).permit(
      :product_name, :introduction, :category_id, :status_id, :shipping_fee_status_id,
      :category_id, :prefecture_id, :lead_time_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
