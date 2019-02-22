require 'acceptance_helper'

resource "Restaurant/Customer" do
  header "Accept", "application/json"
  header "Content-Type", "application/json"


  let(:restaurant) { Restaurant.create(:poc_contact_no => "1111122222", :otp => 3381, :password => "nir") }
  
  post "/signup" do
    
    parameter :type, "Type of user- Customer/Restaurant", :required => true
    parameter :contact_no, "Contact no of customer or person of contact for Restaurant", :required => true
  

    let(:type) { "restaurant" }
    let(:contact_no) { 9168921251 }

    let(:raw_post) { params.to_json }

    example_request "Registering the mobile number" do
      explanation "Record will be added to database with contact_no and otp"
      expect(status).to eq(201)
    end
  end

  post "/verify" do
    
    parameter :type, "Type of user- Customer/Restaurant", :required => true
    parameter :otp, "OTP sent to the registered mobile number", :required => true

    #response_field :token, "Authentication token"


    let(:type) { "restaurant" }
    let(:otp) { restaurant.otp }

    let(:raw_post) { params.to_json }

    example_request "Verifying the otp " do
      expect(status).to eq(200)
    end
  end

  patch "/update" do
    parameter :type, "Type of user- Customer/Restaurant", :required => true
    parameter :res_name, "Name of the restaurant/customer", :required => true
    parameter :poc_name, "Name of the person of contact for restaurant / Customer", :required => true
    parameter :poc_email, "Email of the person of contact for restaurant / Customer"
    parameter :password, "Password", :required => true
    parameter :contact_no, "Contact number of person", :required => true


    let(:type) {"restaurant"}
    let(:res_name) { "Paramhhans" }
    let(:poc_name) {'Ajay Gupta'}
    let(:poc_email) { "ajay@abc.com" }
    let(:password) { "ajay" }
    let(:contact_no) { restaurant.poc_contact_no }

    let(:raw_post) { params.to_json }

    example_request "Updating an account" do
      expect(status).to eq(200)
    end
  end
end