module Msg91
  class Message
    def self.send_text(sender_id, route, country, recepients, text)
      auth_key = Msg91.configuration.auth_key
      url = URI('http://api.msg91.com/')
      http = Net::HTTP.new(url.host, url.port)
      path = '/api/v2/sendsms'
      headers = { 'authkey' => auth_key, 'Content-Type' => 'application/json' }
      body_json = build_json(sender_id, route, text, recepients, country)
      response = http.post(path, body_json, headers)
      JSON.parse(response.read_body)
    end

    class << self
      private

      def build_json(sender_id, route, country, recepients, text)
        body_hash = {}
        content = {}
        sms = []
        body_hash['sender'] = sender_id
        body_hash['route'] = route
        body_hash['country'] = country
        content['message'] = text
        content['to'] = recepients
        sms = sms.push(content)
        body_hash['sms'] = sms
        body_hash['unicode'] = 1
        JSON.generate(body_hash, quirks_mode: true)
      end
    end
  end
end
