class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
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
  end

  def edit
  end

  def update
    if @item = Item.update(item_params)
       redirect_to items_path(item_params)
    else
      render :edit
    end
  end


    def set_item
      @item = Item.find(params[:id])
    end
  


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
