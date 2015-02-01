class Message < ActiveRecord::Base

	validates :name, :text, presence: true,
	                 length: { in: 5..500 }

end
