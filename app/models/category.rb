class Category < ApplicationRecord
  has_many :items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

end
