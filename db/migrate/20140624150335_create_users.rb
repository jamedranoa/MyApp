class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, unique: true
      t.string :fname, null: false
      t.string :lname
      t.string :education
      t.string :job
      t.string :sex
      t.string :picture
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true
  end
end

