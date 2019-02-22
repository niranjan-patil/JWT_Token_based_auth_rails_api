class SessionsController < ApplicationController
	def create
		if(params[:type]=='restaurant')
			otp = rand(6 ** 6)
			@restaurant = Restaurant.new(poc_contact_no: params[:contact_no], otp: otp, password: 'nir')
			if @restaurant.save 
				render :json => @restaurant, :status => 201
			else
				render json: @restaurant.errors.full_messages
			end
		elsif params[:type]=='user'
			otp = rand(6 ** 6)
			@user = User.new(contact_no: params[:contact_no], otp: otp, password: 'nir')
			if @user.save 
				render :json => @user, :status => 201
			else
				render json: @user.errors.full_messages
			end
		end
	end

	def verify

		if(params[:type]=='restaurant')
			command = AuthenticateRestaurant.call(params[:otp])
			if command.success?
				render :json => { auth_token: command.result }, :status => 200
			else
				render json: { error: command.errors }, status: :unauthorized
			end
		elsif params[:type]=='user'
			command = AuthenticateVerUser.call(params[:otp])
			if command.success?
				render json: { auth_token: command.result }
			else
				render json: { error: command.errors }, status: :unauthorized
			end
		end
	end

	def update
		if params[:type]=='restaurant'
			@restaurant = Restaurant.find_by(poc_contact_no: params[:contact_no])
			if @restaurant && @restaurant.update(res_name: params[:rest_name], poc_name: params[:poc_name], poc_email: params[:poc_email], password: params[:password])
				render :json => @restaurant, status => 200
			else
				render json: { error: "UPdate unsuccessful" }, status: :unauthorized
			end
		elsif params[:type]=='user'
			@user = User.find_by(contact_no: params[:id])
			if @user && @user.update(name: params[:name], email: params[:email], password: params[:password])
				render json: I18n.t('signup_success')
			else
				render json: I18n.t('signup_not_success')
			end
		end
	end
end
