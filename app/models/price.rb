class Price < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '~ ¥1,000' },
    { id: 3, name: '¥1,000 ~ ¥5,000' },
    { id: 4, name: '¥5,000 ~ ¥10,000' },
    { id: 5, name: '¥10,000 ~ ¥15,000' },
    { id: 6, name: '¥15,000 ~ ¥20,000' },
    { id: 7, name: '¥20,000 ~ ¥30,000' },
    { id: 8, name: '¥30,000 ~ ¥50,000' },
    { id: 9, name: '¥50,000 ~ ¥100,000' },
    { id: 10, name: '¥100,000 ~' }
  ]

  include ActiveHash::Associations
  has_many :items

end