class FaceType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'キュート' },
    { id: 3, name: 'アクティブキュート' },
    { id: 4, name: 'フレッシュ' },
    { id: 5, name: 'クールカジュアル' },
    { id: 6, name: 'フェミニン' },
    { id: 7, name: 'ソフトエレガント' },
    { id: 8, name: 'エレガント' },
    { id: 9, name: 'クール' }
  ]

  include ActiveHash::Associations
  has_many :users

end