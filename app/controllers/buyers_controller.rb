class BuyersController < ApplicationController
  def index
    @buyer = Buyer.new
  end

  def new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.valid?
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:buyer).permit(:price)
  end

end
