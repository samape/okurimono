class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item_category = ItemCategory.new
  end

  def create
    @item_category = ItemCategory.new(item_params)
    if @item_category.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item_category).permit(
      :title, :content, :price_id, :shop_url, :shop_address, :genre_id, {images: []}
    ).merge(user_id: current_user.id)
  end
end
