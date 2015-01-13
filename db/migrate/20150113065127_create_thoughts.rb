class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :title
      t.text :body
      t.references :link, index: true
      t.datetime :published

      t.timestamps null: false
    end
    add_foreign_key :thoughts, :links
  end
end
