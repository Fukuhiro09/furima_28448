class PurchaseController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
   @purchase = UserPurchase.new(purchase_params)
   if @purchase.save
    redirect_to root_path
   else
    reder 'index'
   end 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer = Payjp::Customer.create(
    description: 'test', # テストカードであることを説明
    card: params[:card_token] # 登録しようとしているカード情報
    )
  end
  
  def new
    @purchase = Purchase.new   
  end
  
  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :card_token, :item_id).merge(user_id: current_user.id)
  end
  
end 