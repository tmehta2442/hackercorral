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
		@user =  User.find(@event.user_id).username
	end

	def sign_up
		#@usersd =  EventParticipant.create( user_id: current_user.id, event_id: params[:event_id] )
		ep = EventParticipant.create( user_id: current_user.id, event_id: params[:event_id] )
		if ep.save
			@user = Event.find(params[:event_id]).user
			HackerMailer.user_signup(@user, Event.find(params[:event_id])).deliver
		end
		redirect_to root_path
	end

end
