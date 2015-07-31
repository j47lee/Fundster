class ChangeCcValueForUsers < ActiveRecord::Migration
  def change
    change_column :users, :cc_no, :bigint
  end
end
