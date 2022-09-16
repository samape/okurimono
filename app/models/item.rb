class Item < ApplicationRecord
  belongs_to :user
  has_one :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price

  has_many_attached :images
end
