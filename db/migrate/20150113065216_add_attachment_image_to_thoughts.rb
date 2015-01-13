class AddAttachmentImageToThoughts < ActiveRecord::Migration
  def self.up
    change_table :thoughts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :thoughts, :image
  end
end
