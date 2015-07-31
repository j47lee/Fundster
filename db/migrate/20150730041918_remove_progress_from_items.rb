class RemoveProgressFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :progress
  end
end
