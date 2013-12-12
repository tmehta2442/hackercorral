class Event < ActiveRecord::Base
	belongs_to :user
	
	attr_accessible :event_name, :event_location, :event_details

  
end
