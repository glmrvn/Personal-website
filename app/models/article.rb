class Article < ActiveRecord::Base

  has_attached_file :image, :styles => { :thumb  => [ "", :jpg ],
                                         :medium => [ "600x9000", :jpg] },
                            :convert_options => { :thumb => "-gravity north -thumbnail 243x324^ -extent 243x324"},
                            :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, :text, presence: true,
                           length: { minimum: 5 }

  validates_attachment :image, presence: true,
                               size: { in: 0..15.megabytes }

  scope :last_update_at, ->{order('updated_at').last}

  def previous_post
    self.class.where("see_count < ?", see_count).order(see_count: :desc).first
  end

  def next_post
    self.class.where("see_count > ?", see_count).order(see_count: :asc).first
  end

end
