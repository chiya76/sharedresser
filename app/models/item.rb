class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :rating
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :rating_id, numericality: { other_than: 1, message: "can't be blank" }

  def self.search(search)
    if search != ''
      Item.where('item_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
