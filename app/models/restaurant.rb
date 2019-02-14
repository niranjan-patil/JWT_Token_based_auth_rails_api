class Restaurant < ApplicationRecord

  	attr_accessor :password
	validates :poc_contact_no, presence: true
	validates :poc_contact_no, numericality: { only_integer: true }
	validates :poc_contact_no, length: { is: 10 }
	#validates :rest_name,:poc_name,:poc_email,:encrypted_password, presence: true, on: :update

end
