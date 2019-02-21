class StoresController < ApplicationController
    before_action :get_store, only: [:show, :edit, :delete, :update]
  
    def index
      @stores = Store.all();
    end
  
    def show
    end
  
    def new
      @store = Store.new()
    end
  
    def edit
    end
  
    def create
      @store = Store.new(store_params)
  
      if(@store.save())
        redirect_to(store_path(@store.id))
      else
        render(:new)
      end
    end
  
    def update
      if(@store.update(store_params))
        redirect_to(store_path(@store.id))
      else
        render(:edit)
      end
    end
  
    def destroy
      Store.destroy(params[:id])
      redirect_to stores_path
    end
  
  
    private
      def get_store
        return @store = Store.find(params[:id])
      end
  
      def store_params
        return params.require(:store).permit(:name, :inventory, :year_opened, :description)
      end
end
