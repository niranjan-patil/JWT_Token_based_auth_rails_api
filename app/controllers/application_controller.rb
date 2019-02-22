class ApplicationController < ActionController::API
	#before_action :authenticate_user_request
	#before_action :authenticate_rest_request

  attr_reader :current_restaurant, :current_user

  private

  def authenticate_rest_request
    @current_restaurant = AuthorizeRestApiRequest.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_restaurant
  end
  def authenticate_user_request
    @current_user = AuthorizeApiRequest.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
