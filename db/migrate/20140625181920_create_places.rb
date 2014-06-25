class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :owner_id, null: false
      t.string :title, null: false
      t.string  :kind
      t.integer :max_guest
      t.integer :price
      t.string :bed_type
      t.string :num_bathrooms
      t.string :num_beds
      t.string :country
      t.string :city
      t.string :neighborhood
      t.string :address
      t.string :picture


      t.timestamps
    end
    add_index :places, :country
    add_index :places, :city
    add_index :places, :neighborhood
    add_index :places, :address
    add_index :places, :price
    add_index :places, :title
  end
end
