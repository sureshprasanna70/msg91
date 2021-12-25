require 'msg91'
Msg91.configuration.auth_key = '<your_api_key>'
template_id = '1'
mobile = '919442573755'
response = Msg91::Otp.send_otp(template_id, mobile)
puts response
