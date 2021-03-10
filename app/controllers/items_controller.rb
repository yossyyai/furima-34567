class ItemsController < ApplicationController
  def index

  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:charges_id,:prefectures_id,:ship_date_id,:price,:user_id)
  end
end
