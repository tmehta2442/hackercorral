class Event < ActiveRecord::Base
	belongs_to :user
	has_many :event_participants

	has_many :participants, through: :event_participants, 
		source: :user

	attr_accessible :event_name, :event_location, :event_details, 
									:user_id, :start_time

# A has_many :through association used to set up a 
# many-to-many connection with another model. This association 
# indicates that the declaring model can be matched with zero 
# or more instances of another model by proceeding through a 
# third model.

  
end




