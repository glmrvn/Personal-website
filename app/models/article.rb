class Article < ActiveRecord::Base

	has_attached_file :image, :styles => { :medium => "300x514>" }, :default_url => "/images/:style/missing.png"
    
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :title, presence: true,
	                  length: { minimum: 5 }

	validates :text,  presence: true,
	                  length: { minimum: 5 }

	validates_attachment :image, presence: true,
	                             size: { in: 0..10.megabytes }

end
