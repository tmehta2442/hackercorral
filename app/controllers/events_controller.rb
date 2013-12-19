class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
		@user = User.new(params[:user])
		if @user.save
			HackerMailer.signup_confirmation(@user).deliver
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thanks for signing up"
		end
	end

	def create
		@event = Event.create(params[:event])
		@user = current_user
		
		if @event.save
			HackerMailer.event_confirmation(@user).deliver
			redirect_to @event
		else
			render "new"
		end
	end

	def show
		@event = Event.find(params[:id])

	end

	def sign_up
		# @event_id = Event.find(params[:id])
		# @events = Event.find(params[:id])
		# @event_participants = EventParticipants.create(@event)
		# EventParticipants.create(@event)
		# asfgasdgssgfklhjafsklgj
		# @event = User.find(params[:id])
		# EventParticipant.create(@event)
		# @event = Event.find(params[:id])
		# EventParticipant.create(@event)
		# EventParticipant.create(Event.find(params[:id]))
		# EventParticipant.create(event.id) #this creates event participant, no user_id/event_id
		# EventParticipant.create(event_id)
		# EventParticipant.create(@event.id)
		# EventParticipant.create(id)
		# EventParticipant.create(params[:id])
		EventParticipant.create(user_id: current_user.id, event_id: params[:event_id] )
		redirect_to root_path
	end

end

# somewhere here need to get info from event's show to 
# send to event's database. 
