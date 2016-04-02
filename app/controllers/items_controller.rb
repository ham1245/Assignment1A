class ItemsController < ApplicationController

  def index
    @items =Item.all
  end
  def new
    @list= List.find(params[:id])
    @item = @list.items.build

  end

  def create
    @list= List.find(params[:id])
    @item = @list.items.build(item_params)
      if @item.save
          redirect_to new_item_path(:id=> @list.id)
      else
         render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to (:back)
  end

  private
  def item_params
    params.require(:item).permit(:list_id, :name)
  end
end
