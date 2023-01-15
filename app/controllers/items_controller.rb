class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to root_path
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :description, :category_id, :rating_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end
