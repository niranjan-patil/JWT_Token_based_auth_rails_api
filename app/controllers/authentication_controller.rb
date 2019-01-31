class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   
   command = AuthenticateUser.call(params[:email],params[:password])

   if command.success?
     render json: { auth_token: command.result }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end
 private
  def article_params
    params.require(:user).permit(:email, :password)
  end
end