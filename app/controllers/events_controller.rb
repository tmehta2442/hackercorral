class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.create(params[:event])
		
		if @event.save
			redirect_to @event
		else
			render "new"
		end
	end


end
