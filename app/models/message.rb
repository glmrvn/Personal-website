class Message < ActiveRecord::Base

	validates :name, presence: true,
	                 length: { in: 5..500 }

	validates :text, presence: true,
	                 length: { in: 5..500 }
end
