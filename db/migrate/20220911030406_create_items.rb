class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :title,         null: false
      t.text        :content,       null: false
      t.integer     :price_id,      null: false
      t.string      :shop_url      
      t.string      :shop_address
      t.references  :user,          null: false, foreign_key: true  
      t.timestamps
    end
  end
end
