class AuthenticateVerUser
  prepend SimpleCommand

  def initialize(otp)
    @otp = otp
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :otp 

  def user
    user = User.find_by(otp: otp)
    return user if user

    errors.add :user_authentication, 'invalid otp'
    nil
  end
end
