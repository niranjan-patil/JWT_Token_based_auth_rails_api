class AuthenticateUser
  prepend SimpleCommand

  def initialize(phone, password)
    @contact_no = phone
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :contact_no, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end

#curl -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDg4MzQwNTJ9.sX2n9EPg2-hoO9ToO3IhWNgwOAf5n4drhXy3Ufphm-g" http://localhost:3000/items