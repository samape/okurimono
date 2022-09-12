class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price

  with_options presence: true do
    validates :title, :content, :user
  end

  validates :genre_id, :price_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shop_url, format: { with: /\Ahttp(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w-.\/?%&=]*)?/ }
end
