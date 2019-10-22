class DealingsController < ApplicationController

  def create
    
    @item = Item.find(params[:item_id])
    @dealings = @item.item_users.build(user_id: current_user.id)
    @dealings.save

  end
end
