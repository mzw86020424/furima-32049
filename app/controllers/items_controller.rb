class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :sold_out]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
    redirect_to root_path if current_user.id != @item.user_id || @item.order != nil
  end

  def update
    if @item.order != nil
      redirect_to root_path
    elsif @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user == @item.user || @item.order != nil
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :product_name, :introduction, :category_id, :status_id, :shipping_fee_status_id,
      :category_id, :prefecture_id, :lead_time_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out
    if @item.order != nil
      redirect_to root_path
    end
  end
end
