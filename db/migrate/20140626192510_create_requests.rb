class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :place_id
      t.integer :applicant_id
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
    add_index :requests, :place_id
    add_index :requests, :applicant_id
  end
end
