class CreateReservedDates < ActiveRecord::Migration
  def change
    create_table :reserved_dates do |t|
      t.integer :place_id
      t.date :day
      t.timestamps
    end
    add_index :reserved_dates,[:place_id,:day], unique: true
  end
end
