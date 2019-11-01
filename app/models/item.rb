class Item < ApplicationRecord
  has_many :item_users
  has_many :users , through: :item_users

  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  def liked_by(user)
    # user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, item_id: id)
  end

end
