class MakeupType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ナチュラル' },
    { id: 3, name: '華やか' }
  ]

  include ActiveHash::Associations
  has_many :users

end