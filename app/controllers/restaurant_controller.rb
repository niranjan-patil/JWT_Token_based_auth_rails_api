class RestaurantController < ApplicationController
	def create
		otp = 1234
		@restaurant = Restaurant.new(poc_contact_no: params[:poc_contact_no], otp: otp)
		if @restaurant.save 
			render json: "OTP sent", status: :ok
		else
			render json: @restaurant.errors.full_messages
		end
	end
	def verify
		if Restaurant.find_by(otp: params[:otp])
			render json: "OTP verified successfully", status: :ok
		else
			render json: "Invalid otp"
		end
	end
	def update
		@restaurant = Restaurant.find_by(poc_contact_no: params[:poc_contact_no])
		if @restaurant.update(rest_name: params[:rest_name], poc_name: params[:poc_name], poc_email: params[:poc_email], encrypted_password: params[:encrypted_password])
			render json: "Sign up successful"
		else
			render json: "Unsuccessful"
		end
	end
end
