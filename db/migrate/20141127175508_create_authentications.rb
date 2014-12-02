class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.belongs_to :profile, index: true
      t.string :provider 
      t.string :uid
      t.string :oauth_token 
      t.datetime :oauth_expires_at
      t.string :image, default: "https://s3-sa-east-1.amazonaws.com/raspasimages/public/logo.png"

      t.timestamps null: false
    end
  end
end