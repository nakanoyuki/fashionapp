class Item < ApplicationRecord
  has_many :users , through: :item_users
  has_many :item_users
end
