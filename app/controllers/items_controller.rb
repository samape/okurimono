class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
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

  private
  def item_params
    params.require(:item).permit(
      :title, :content, :price_id, :genre_id, :shop_url, :shop_address
    ).merge(user_id: current_user.id)
  end
end