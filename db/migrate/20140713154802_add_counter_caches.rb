class AddCounterCaches < ActiveRecord::Migration
  def change
    add_column :users, :notifications_count, :integer
    add_column :reviews, :notifications_count, :integer
  end
end
