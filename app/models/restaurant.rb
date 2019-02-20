class Restaurant < ApplicationRecord
	has_secure_password
	validates :poc_contact_no, presence: true, numericality: { only_integer: true }
	validates :poc_contact_no, uniqueness: true
end
