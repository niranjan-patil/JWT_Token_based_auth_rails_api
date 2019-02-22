class RestaurantController < ApplicationController
	#skip_before_action :authenticate_rest_request, :only => [:create, :verify]
	#skip_before_action :authenticate_user_request

	def create
		otp = rand(6 ** 6)
		@restaurant = Restaurant.new(poc_contact_no: params[:contact_no], otp: otp, password: 'nir')
		if @restaurant.save 
			render json: I18n.t('otp_sent'), status: :ok
		else
			render json: @restaurant.errors.full_messages
		end
	end

	def index 
	end

	def verify
		command = AuthenticateRestaurant.call(params[:otp])

		if command.success?
			render json: { auth_token: command.result }
		else
			render json: { error: command.errors }, status: :unauthorized
		end
	end

	def update
		@restaurant = Restaurant.find_by(poc_contact_no: params[:id])
		if @restaurant && @restaurant.update(res_name: params[:rest_name], poc_name: params[:poc_name], poc_email: params[:poc_email], password: params[:password])
			render json: I18n.t('signup_success')
		else
			render json: I18n.t('signup_not_success')
		end
	end
end
