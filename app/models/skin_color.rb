class SkinColor < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '普通' },
    { id: 3, name: '色白' },
    { id: 4, name: '色黒' }
  ]

  include ActiveHash::Associations
  has_many :users
end
