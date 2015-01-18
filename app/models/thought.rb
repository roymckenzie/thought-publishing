class Thought < ActiveRecord::Base
  extend FriendlyId
  enum kind: [ :text, :photo, :link ]
  has_attached_file :image, :styles => { :large => "640x480#", :medium => "480x360#", :thumb => "100x75#" }
  friendly_id :slug_candidates, use: :slugged
  belongs_to :link
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  process_in_background :image, processing_image_url: :process_image

  def self.search(trash)
    if trash == "true"
      query = Thought.where( trash: true )
    else
      query = Thought.where( trash: false )
    end
    query.order( published: :desc )
  end

  def slug_candidates
    [
      :title,
      [ :title, Time.now.year ]
    ]
  end

  def process_image
      options = image.options
      options[:interpolator].interpolate( options[:url], image, :original )
  end
end
