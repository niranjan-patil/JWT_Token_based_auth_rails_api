class UserController < ApplicationController
	skip_before_action :authenticate_user_request, :only => [:create, :verify]
	skip_before_action :authenticate_rest_request
=begin
	def create
		otp = rand(6 ** 6)
		@user = User.new(contact_no: params[:contact_no], otp: otp, password: 'nir')
		if @user.save 
			render json: I18n.t('otp_sent'), status: :ok
		else
			render json: @user.errors.full_messages
		end
	end

	def index 
	end

	def verify
		command = AuthenticateVerUser.call(params[:otp])

   	if command.success?
     	render json: { auth_token: command.result }
   	else
     	render json: { error: command.errors }, status: :unauthorized
   	end
	end
=end
	def update
		@user = User.find_by(contact_no: params[:id])
		if @user && @user.update(name: params[:name], email: params[:email], password: params[:password])
			render json: I18n.t('signup_success')
		else
			render json: I18n.t('signup_not_success')
		end
	end
end
