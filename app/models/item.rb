class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price
  belongs_to :genre

  has_many_attached :images

  with_options presence: true do
    validates :title, :content
    validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  end

  validates :genre_id, :price_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :shop_url, format: { with: /\Ahttp(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w-.\/?%&=]*)?/ }
end
