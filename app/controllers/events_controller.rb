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
		@events = Event.all
	end

end
