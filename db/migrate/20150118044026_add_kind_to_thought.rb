class AddKindToThought < ActiveRecord::Migration
  def change
    add_column :thoughts, :kind, :integer, :default => 0
  end
end
