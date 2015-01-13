class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.text :descr
      t.string :site_name

      t.timestamps null: false
    end
    add_index :links, :url, unique: true
  end
end
