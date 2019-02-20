class AuthenticateLoginRestaurant
  prepend SimpleCommand

  def initialize(contactno, password)
    @poc_contact_no = contactno
    @password = password
  end

  def call
    JsonWebToken.encode(restaurant_id: restaurant.id) if restaurant
  end

  private

  attr_accessor :poc_contact_no, :password

  def restaurant
    restaurant = Restaurant.find_by(poc_contact_no: poc_contact_no)
    return restaurant if restaurant && restaurant.authenticate(password)

    errors.add :restaurant_authentication, 'invalid credentials'
    nil
  end
end

