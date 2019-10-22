class ItemsController < ApplicationController
  def index
      @items = Item.order('id ASC').limit(20)
    end
  
  def show
    @item = Item.find(params[:id])
  end
    
end
