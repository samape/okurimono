class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '食品' },
    { id: 3, name: 'スイーツ' },
    { id: 4, name: 'アクセサリー' },
    { id: 5, name: 'ファッション' },
    { id: 6, name: 'コスメ' },
    { id: 7, name: '食器・キッチン用品' },
    { id: 8, name: '家電' },
    { id: 9, name: 'スポーツ' },
    { id: 10, name: '日用品' },
    { id: 11, name: '文房具' },
    { id: 12, name: 'おもちゃ' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :categories

end