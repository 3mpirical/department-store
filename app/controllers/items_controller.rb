class ItemsController < ApplicationController
    before_action :get_item, only: [:show, :item, :edit, :update]
    before_action :get_store, only: [:index, :show, :new, :create, :edit]

  def index
    @items = @store.items
  end

  def show
  end

  def new
    @item = @store.items.new()
  end

  def edit
  end

  ### form_for in erb was throwing an error for an incorrect path, 
  ### so the params were sent in a form which did not explicitly 
  ### attach attributes to the :item param.
  def create
    result = Item.create(
        store_id: params[:store_id],
        name: params[:name],
        cost: params[:cost]
    )

    if(result)
        redirect_to(store_items_path(params[:store_id]))
    else
        render(:new)
    end
  end

  ### form_for in erb was throwing an error for an incorrect path, 
  ### so the params were sent in a form which did not explicitly 
  ### attach attributes to the :item param.
  def update
    result = @item.update(
        store_id: params[:store_id],
        name: params[:name],
        cost: params[:cost]
    )

    if(result)
        redirect_to(store_items_path(params[:store_id]))
    else
        render(:edit)
    end
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to store_items_path
  end

  private
    def item_params
      return params.require(:item).permit(:name, :cost)
    end

    def get_store
      return @store = Store.find(params[:store_id])
    end

    def get_item
      return @item = Item.find(params[:id])
    end
end







