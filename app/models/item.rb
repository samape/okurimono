class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price
end
