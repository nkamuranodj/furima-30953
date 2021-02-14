class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    #@items = Item.all
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :price, :delively_payer_id,
                                 :ship_area_id, :ship_day_id).merge(user_id: current_user.id)
  end
end
