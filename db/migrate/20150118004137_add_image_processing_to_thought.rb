class AddImageProcessingToThought < ActiveRecord::Migration
  def change
    add_column :thoughts, :image_processing, :boolean
  end
end
