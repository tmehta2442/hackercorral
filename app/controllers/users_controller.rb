class UsersController < ApplicationController

	def index
		@users = User.all
		@events = Event.all
		gon.current_user = current_user
		gon.events = Event.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			HackerMailer.signup_confirmation(@user).deliver
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thanks for signing up"
		else 
			render "new"
		end
	end

end
