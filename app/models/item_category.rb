class ItemCategory
  include ActiveModel::Model
  attr_accessor :titel, :content, :images, :price, :shop_url, :shop_address, :user_id, :genre, :item_id

  with_options presence: true do
    validates :title, :content, :user_id, :item_id
    validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  end

  validates :genre, :price, numericality: { other_than: 1, message: "can't be blank" }
  # validates :shop_url, format: { with: /\Ahttp(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w-.\/?%&=]*)?/ }

  validate :required_either_email_or_phone

  def save
    item = Item.create(titel: title, content: content, images: images, price: price, shop_url: shop_url, shop_address: shop_address, user_id: user_id)
    Category.create(genre: genre, item_id: item.id)
  end

  private
  def required_either_email_or_phone
    return if email.present? || phone.present?
    errors.add(:base, "販売店サイトのURLまたは販売店の住所のどちらか一方を入力してください")
  end
end