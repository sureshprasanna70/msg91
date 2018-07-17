module Msg91
  class Message
    
    def self.send_text(sender_id,route,country,recepients,text)
      auth_key = Msg91.configuration.auth_key
      url = URI("http://api.msg91.com/")
      http = Net::HTTP.new(url.host, url.port)
      path = '/api/v2/sendsms'
      headers = {'authkey' => auth_key,'Content-Type' => 'application/json','unicode' => '1'}
      body_json = build_json(sender_id,route,text,recepients,country)
      response = http.post(path,body_json,headers)
      parsed_response = JSON.parse(response.read_body)
      return parsed_response
    end

    class << self

      private

      def build_json(sender_id,route,country,recepients,text)
        body_hash = Hash.new
        content = Hash.new
        sms = Array.new
        body_hash["sender"] = sender_id
        body_hash["route"] = route
        body_hash["country"] = country
        content["message"] = text 
        content["to"] = recepients
        sms = sms.push(content)
        body_hash["sms"] = sms
        body_json = JSON.generate(body_hash, quirks_mode: true)
        return body_json
      end

    end
  end
end
