require 'msg91'
Msg91.configuration.auth_key = '<your_api_key>'
mobile = '919442573755'
retrytype = 'text'
response = Msg91::Otp.resend_otp(retrytype, mobile)
puts response
