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
		# @event = Event.includes(:participants).find(params[:id])
		@event = Event.find(params[:id])

	end

	def sign_up

		EventParticipant.create( user_id: current_user.id, event_id: params[:event_id] )
		# @eventparticipant = EventParticipants.all
		redirect_to root_path
	end

end
