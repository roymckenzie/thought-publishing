class AddCanonicalUrlToLink < ActiveRecord::Migration
  def change
    add_column :links, :canonical_url, :string
  end
end
