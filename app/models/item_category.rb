class ItemCategory
  include ActiveModel::Model
  attr_accessor :title, :content, :images, :price_id, :shop_url, :shop_address, :user_id, :genre_id, :item_id

  with_options presence: true do
    validates :title, :content, :user_id, :item_id
    validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  end

  validates :genre_id, :price_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :shop_url, format: { with: /\Ahttp(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w-.\/?%&=]*)?/ }

  validate :required_either_email_or_phone

  def save
    item = Item.create(title: title, content: content, images: images, price_id: price_id, shop_url: shop_url, shop_address: shop_address, user_id: user_id)
    Category.create(genre_id: genre_id, item_id: item.id)
  end

  private
  def required_either_email_or_phone
    return if email.present? || phone.present?
    errors.add(:base, "販売店サイトのURLまたは販売店の住所のどちらか一方を入力してください")
  end
end