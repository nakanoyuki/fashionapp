class UsersController < ApplicationController

  def show
    @items = current_user.items

 
  def show
    @user = User.find(current_user.id)

  end
end
