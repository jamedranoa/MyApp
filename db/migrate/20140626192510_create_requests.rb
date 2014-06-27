class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :place_id, null: false
      t.integer :applicant_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :approved
      t.timestamps
    end
    add_index :requests, :place_id
    add_index :requests, :applicant_id
  end
end
