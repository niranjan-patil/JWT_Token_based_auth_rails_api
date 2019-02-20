require 'rails_helper'
describe Restaurant, :type => :model do

 describe 'validations' do
   context 'validates poc_contact_no' do
     it { should validate_presence_of(:poc_contact_no)}
     it { should validate_uniqueness_of(:poc_contact_no)}
     it { should validate_numericality_of(:poc_contact_no).only_integer}
   end
 end

 # describe 'verifying OTP' do
 #   context 'with otp as an input' do
 #     it 'should detect if otp entered is valid' do
 #       otp = '123456'
 #       expect(subject.isOtpValid? otp).to be true

 #     end

 #     it 'should detect if otp entered is invalid' do
 #       otp = '3456'
 #       expect(subject.isOtpValid? otp).to be false
 #     end
 #   end
 # end

 describe 'restaurant SignUp' do
   let(:email_regex) { /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
   context 'with email as input' do
     it 'should detect if email entered satifies the given regex' do
       poc_email = 'abc@das.com'
       expect(poc_email).to match(email_regex)
     end

     it 'should detect if email entered does not satify the given regex' do
       poc_email = 'abc1das,com'
       expect(poc_email).to_not match(email_regex)
     end
   end

   context 'with password as input' do
     let(:pass_regex) { /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/ }
     it 'should detect if password satifies the regex'do
       password_digest = 'Abcdf1'
       expect(password_digest).to match(pass_regex)
     end
     it 'should detect if password does not satify the regex'do
       password_digest = 'abc'
       expect(password_digest).to_not match(pass_regex)
     end
   end
 end
end