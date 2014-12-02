class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name, index: true, unique: true
      t.string :username, index: true, unique: true
      t.string :slug, index: true, unique: true
      t.string :image
      t.text :bio
      t.date :dob
      t.date :dod
      t.string :website
      t.integer :fans_count, default: 0
      t.integer :idols_count, default: 0

      t.timestamps
    end
  end
end