class DealingsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @dealings = @item.item_users.build(user_id: current_user.id)
    @dealings.save
  end

  def destroy
    @item = Item.find(params[:id])
    user_id===current_user.id
    @item.destroy if @item.user_id == current_user.id
  end

end
