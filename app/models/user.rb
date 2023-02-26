class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :face_type
  belongs_to :makeup_type
  belongs_to :personal_color
  belongs_to :skin_color
  belongs_to :skin_type

  validates :nickname, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角で英字と数字の両方を含んでください'

  validates :age_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :face_type_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :makeup_type_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :personal_color_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :skin_color_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :skin_type_id, numericality: { other_than: 1, message: 'を入力してください' }
end
