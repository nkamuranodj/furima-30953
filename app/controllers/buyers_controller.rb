class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :sel_item, only: [:index, :create]
  before_action :item_user, only: [:index, :create]

  def index
    @buyer_item = BuyerItem.new
  end

  def new
  end

  def create
    @buyer_item = BuyerItem.new(buyer_params)
    if @buyer_item.valid?
      pay_item
      @buyer_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def sel_item
    @item = Item.find(params[:item_id])
  end

  def item_user
    if current_user == @item.user || @item.buyer.present?
    redirect_to root_path 
    end
  end

  def buyer_params
    params.require(:buyer_item).permit(:postnumber, :shiparea_id, :city, :deliveryaddres,
                                       :deliverymunicipality, :builname, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
