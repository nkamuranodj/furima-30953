class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order("created_at DESC")
    # 購入されているかの条件判定のため、仮のインスタンス
    @buyers = nil
    # 購入されているかの条件判定のため、仮のインスタンス 
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :price, :deliverypayer_id,
                                 :shiparea_id, :shipday_id).merge(user_id: current_user.id)
  end
end
