class Thought < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  belongs_to :link
  has_attached_file :image, :styles => {:large => "800x600#", :medium => "600x450#", :thumb => "100x75#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # Re-enable once delayed_paperclip sanitization bug is fixed.
  # process_in_background :image

  def self.search(trash)
    if trash == "true"
      query = Thought.where(trash: true)
    else
      query = Thought.where(trash: false)
    end
    query.order(published: :desc)
  end

  def slug_candidates
    [
      :title,
      [ :title, Time.now.year ]
    ]
  end
end
