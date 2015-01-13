class Thought < ActiveRecord::Base
  belongs_to :link
  has_attached_file :image, :styles => {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "https://placehold.it/300x300"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
