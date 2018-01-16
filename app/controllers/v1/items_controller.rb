class V1::ItemsController < ApplicationController
  def index
    @items = Item.all

    json_response @items
  end

  def show
    @item = Item.find(params[:id])

    json_response @item
  end

  def by_category
    @items = Item.by_categories(params[:category_ids])

    json_response @items
  end
end