class BuyersController < ApplicationController
  def index
    @buyer_item = BuyerItem.new
    @item = Item.find(params[:item_id])
  end

  def new
    @buyer_item = BuyerItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_item = BuyerItem.new(buyer_params)
    if @buyer_item.valid?
      # pay_item
      @buyer_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_item).permit(:postnumber, :shiparea_id, :city, :deliveryaddres,
      :deliverymunicipality, :builname, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount:  @item.price,
      card: buyer_params[:token],
      currency:'jpy'
    )
 end

end
