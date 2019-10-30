class DealingsController < ApplicationController
  before_action :create_product

  def create
    @item = Item.find(params[:item_id])
    @dealings = @item.item_users.new(user_id: current_user.id)
    begin
      @dealings.save
    rescue 
      redirect_to item_path(@item) and return
    end 
      redirect_to root_path
  end


  def destroy
    @item = Item.find(params[:item_id])
    @dealings = @item.item_users.build(user_id: current_user.id)
    @dealings.destroy if @dealings.user_id == current_user.id
  end
  
  def create_product
    @item = Item.find(params[:item_id])
  end


  def show
    
  end
end
