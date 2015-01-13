class Link < ActiveRecord::Base
  has_attached_file :image, :styles => {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "https://placehold.it/300x300"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  before_save :process_link

  def process_link
    og           = OpenGraph.new(self.url)
    self.url     = og.url
    self.title   = og.title
    self.descr   = og.description
    if og.images.any?
      self.image = open(og.images[0])
    end
  end
end
