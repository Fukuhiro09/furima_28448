class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if item = Item.find(params[:id])
      redirect_to items_path(item_params)
    else
      render :edit
    end
  end
 # item = Item.find(params[:id])
    # item.update(item_params)
  


  private

  def item_params
    params.require(:item).permit(
      :image,
      :product_name,
      :info,
      :category_id,
      :sales_status_id,
      :shipping_fee_id,
      :prefecture_id,
      :scheduled_delivery_id,
      :price
    ).merge(user_id: current_user.id)
  end
end
