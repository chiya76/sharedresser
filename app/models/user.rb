class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :face_type
  belongs_to :makeup_type
  belongs_to :personal_color
  belongs_to :skin_color
  belongs_to :skin_type

  validates :nickname, presence: true
  validates :birthday, presence: true

  validates :age_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :face_type_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :makeup_type_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :personal_color_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :skin_color_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :skin_type_id, numericality: { other_than: 1 , message: "can't be blank"}
end
