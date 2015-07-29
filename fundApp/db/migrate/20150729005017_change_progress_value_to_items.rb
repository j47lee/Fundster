class ChangeProgressValueToItems < ActiveRecord::Migration
  def change
    change_column :items, :progress, :float
  end
end
