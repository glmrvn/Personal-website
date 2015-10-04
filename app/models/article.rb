class Article < ActiveRecord::Base

  before_save :text_uppercase

  has_attached_file :image, :styles => { :thumb    => [ "", :jpg ],
                                         :original => [ "600x9000", :jpg] },
                            :convert_options => { :thumb => "-gravity north -thumbnail 243x324^ -extent 243x324"},
                            :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :title, :text, presence: true,
                           length: { minimum: 5 }

  validates_attachment :image, size: { in: 0..15.megabytes }

  scope :last_update_at, ->{ order('updated_at').last }

  def next_post
    self.class.where("created_at < ?", created_at).order(created_at: :desc).first
  end

  def previous_post
    self.class.where("created_at > ?", created_at).order(created_at: :asc).first
  end

  def self.latest
    self.order(:updated_at).last
  end

  def self.image_have
    self.all.where.not(image_url: false)
  end

  def self.web_tag
    self.all.where(tag: 'WEB')
  end

  def self.app_tag
    self.all.where(tag: 'APP')
  end

  def text_uppercase
     self.text.upcase!
  end

end
