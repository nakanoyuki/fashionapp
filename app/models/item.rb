class Item < ApplicationRecord
  has_many :item_users
  has_many :users , through: :item_users
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
end
