class Admin::ItemsController < Admin::BaseController

  def index
    @items.Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    item = Item.find(params[:id])
    if item.update_attributes(item_params)
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      params[:item][:category_ids].each do |category_id|
        item.item_categories.create(category_id: category_id)
      end
      flash[:errors] = "Missing fields. Please try again."
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_ids)
  end
end
