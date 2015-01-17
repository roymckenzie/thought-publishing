class AddSlugToThought < ActiveRecord::Migration
  def change
    add_column :thoughts, :slug, :string
    add_index :thoughts, :slug, unique: true
  end
end
