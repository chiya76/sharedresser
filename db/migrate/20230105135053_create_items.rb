class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name    , null: false
      t.integer :category_id  , null: false
      t.integer :rating_id    , null: false
      t.text    :description  , null: false
      t.integer :user_id      , null: false, foreign_key: true
      t.timestamps
    end
  end
end
