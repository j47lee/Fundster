class AddProgressToItems < ActiveRecord::Migration
  def change
    add_column :items, :progress, :integer
  end
end
