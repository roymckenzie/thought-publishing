class AddImageAttributionToThought < ActiveRecord::Migration
  def change
    add_column :thoughts, :image_attribution, :string
  end
end
