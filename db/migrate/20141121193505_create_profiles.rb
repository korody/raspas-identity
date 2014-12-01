class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :author, null: false, index: true
      t.string :role, null: false, default: 'user'
      t.string :email, null: false, index: true, unique: true
      t.string :password_digest, index: true
      t.string :remember_digest, index: true
      t.string :reset_token, index: true
      t.datetime :reset_token_sent_at
      t.string :oauth_token 
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end