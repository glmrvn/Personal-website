class Article < ActiveRecord::Base

	has_attached_file :image, :styles => { :thumb => [ "", :jpg ],
		                                   :medium => [ "960x9000", :jpg] },
	                          :convert_options => { :thumb => "-gravity north -thumbnail 300x400^ -extent 300x400"},
                              :default_url => "/images/:style/missing.png"
    
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :title, presence: true,
	                  length: { minimum: 5 }

	validates :text,  presence: true,
	                  length: { minimum: 5 }

	validates_attachment :image, presence: true,
	                             size: { in: 0..10.megabytes }

end
