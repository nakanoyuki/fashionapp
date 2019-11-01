class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.build(like_params)
    @item = @like.item
    if @like.save
      respond_to:js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @item = @like.item
    if @like.destroy
      respond_to :js
    end
  end

  private
    def like_params
      params.permit(:item_id)
    end
end
