module Msg91
  class Otp
    def self.send_otp(template_id, mobile, optional_params = {})
      auth_key = Msg91.configuration.auth_key
      params = { template_id: template_id, mobile: mobile, authkey: auth_key }
      params.merge!(optional_params) unless optional_params.empty?
      path = '/api/v5/otp'
      Msg91::HttpClient.new.get(path, params)
    end

    def self.verify_otp(mobile, optional_params = {})
      auth_key = Msg91.configuration.auth_key
      params = { mobile: mobile, authkey: auth_key }
      params.merge!(optional_params) unless optional_params.empty?
      path = 'api/v5/otp/verify'
      Msg91::HttpClient.new.get(path, params)
    end

    def self.resend_otp(retrytype, mobile, optional_params = {})
      auth_key = Msg91.configuration.auth_key
      params = { retrytype: retrytype, mobile: mobile, authkey: auth_key }
      params.merge!(optional_params) unless optional_params.empty?
      path = 'api/v5/otp/retry'
      Msg91::HttpClient.new.get(path, params)
    end
  end
end
