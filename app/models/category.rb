class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'skin' },
    { id: 3, name: 'eyebrows' },
    { id: 4, name: 'eye' },
    { id: 5, name: 'lip' },
    { id: 6, name: 'cheek' },
    { id: 7, name: 'hair' },
    { id: 8, name: 'body' },
    { id: 9, name: 'hand' },
    { id: 10, name: 'nails' },
    { id: 11, name: 'その他' }
  ]
  end