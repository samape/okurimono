class Item < ApplicationRecord
  belongs_to :user
  has_one :category
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price
end
