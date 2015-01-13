class AddAttachmentImageToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :links, :image
  end
end
