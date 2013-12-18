class Event < ActiveRecord::Base
	belongs_to :user
	has_many :event_participants

	has_many :participants, through: :event_participants, 
		source: :user
		
	attr_accessible :event_name, :event_location, :event_details, 
									:user_id, :start_time

  
end
