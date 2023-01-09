class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :rating

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :rating_id, numericality: { other_than: 1 , message: "can't be blank"}
end
