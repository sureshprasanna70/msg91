require 'msg91'
Msg91.configuration.auth_key = '<your_api_key>'
mobile = '919442573755'
optional_params = { otp: '123456', otp_expiry: 10 }
response = Msg91::Otp.verify_otp(mobile, optional_params)
puts response
