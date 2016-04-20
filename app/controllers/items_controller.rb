class ItemsController < ApplicationController
  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path, notice: 'Item saved'
    else
      flash[:alert] = 'Failure, try again'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end
end
