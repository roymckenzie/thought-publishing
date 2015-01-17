class Thought < ActiveRecord::Base
  belongs_to :link
  has_attached_file :image, :styles => {:large => "800x600#", :medium => "600x450#", :thumb => "100x75#" }
  process_in_background :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search(trash)
    if trash == "true"
      query = Thought.where(trash: true)
    else
      query = Thought.where(trash: false)
    end
    query.order(published: :desc)
  end
end
