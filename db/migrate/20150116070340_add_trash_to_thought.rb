class AddTrashToThought < ActiveRecord::Migration
  def change
    add_column :thoughts, :trash, :boolean, :default => false
  end
end
