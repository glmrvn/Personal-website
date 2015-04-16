class Message < ActiveRecord::Base

#validation message. Text presence and set length interval
validates :name, :text, presence: true,
                        length: { in: 5..500 }

end
