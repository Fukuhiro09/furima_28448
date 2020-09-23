class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show,:destroy]
  before_action :find_item, only: :order  # 「find_item」を動かすアクションを限定


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
    if @item.update(item_params)
       redirect_to items_path(item_params)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id && @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


    def set_item
      @item = Item.find(params[:id])
    end

    # def order # 購入する時のアクションを定義
    #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    #   customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    #   Payjp::Charge.create(
    #     amount: @item.price, # 商品の値段
    #     customer: customer_token, # 顧客のトークン
    #     currency: 'jpy' # 通貨の種類（日本円）

    #     ItemOrder.create(item_id: params[:id]) # 商品のid情報を「item_id」として保存する

    #     redirect_to root_path
    #     )
    # end
   
    private
   
    def find_item
      @item = Item.find(params[:id]) # 購入する商品を特定
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
