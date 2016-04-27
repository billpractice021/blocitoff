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

  def edit
     @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
  
     if @item.update(item_params)
       flash[:notice] = "Item was updated successfully."
       redirect_to root_path, notice: 'Item updated'
     else
       flash.now[:alert] = "There was an error saving the item"
       render :edit
     end
   end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted." 
    else
      flash.now[:alert] = "There was an error."
    end
    redirect_to items_path
  end

 
  private
 
  def item_params
    params.require(:item).permit(:description)
  end
end