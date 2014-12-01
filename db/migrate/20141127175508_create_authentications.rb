class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.belongs_to :profile, index: true
      t.string :provider 
      t.string :uid

      t.timestamps null: false
    end
  end
end