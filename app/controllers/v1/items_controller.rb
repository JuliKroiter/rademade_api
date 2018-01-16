class V1::ItemsController < ApplicationController
  def index
    @items = paginate Item.all, per_page: 10

    json_response @items
  end

  def show
    @item = Item.find(params[:id])

    json_response @item
  end

  def by_category
    @items = paginate Item.by_categories(params[:category_ids]), per_page: 10

    json_response  @items
  end
end