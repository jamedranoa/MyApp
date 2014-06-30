class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :maker_id, null: false
      t.integer :reviewable_id, null: false
      t.string :reviewable_type, null: false
      t.integer :score, null: false
      t.timestamps
    end
    add_index :reviews, [:reviewable_id,:reviewable_type]
  end
end
