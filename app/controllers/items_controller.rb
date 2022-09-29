class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :identify_user, only: [:edit, :destroy]
 
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item_category = ItemCategory.new
  end

  def create
    @item_category = ItemCategory.new(item_params)
    if @item_category.valid? 
      @item_category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @category = @item.category
    @item_category = ItemCategory.new(item_params)
  end

  def edit
    item_attributes = @item.attributes
    @item_category = ItemCategory.new(item_params)
  end
  
  def update
    @item_category = ItemCategory.new(item_params)
    if @item_category.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item_category.destroy
  end

  private
  def item_params
    params.require(:item_category).permit(
      :title, :content, :price_id, :shop_url, :shop_address, :genre_id, {images: []}
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def identify_user
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
