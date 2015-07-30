class CreateItemUsers < ActiveRecord::Migration
  def change
    create_table :item_users do |t|
      t.references :item, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :fund

      t.timestamps null: false
    end
  end
end
