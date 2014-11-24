class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :author, null: false
      t.string :role, null: false, default: 'user'
      t.string :email, null: false
      t.string :remember_token
      t.string :password_digest
      t.string :reset_token
      t.datetime :reset_token_sent_at

      t.timestamps null: false
    end
    add_index :profiles, :email, unique: true
    add_index :profiles, :author_id
    add_index :profiles, :remember_token
    add_index :profiles, :reset_token
  end
end