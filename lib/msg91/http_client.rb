module Msg91
  class HttpClient
    attr_accessor :request, :client
    attr_reader :headers, :base_url

    def initialize
      @base_url = URI('https://api.msg91.com/')
      @client = Net::HTTP.new(@base_url.host, @base_url.port)
      @client.use_ssl = true
      @client.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @headers = { 'authkey' => Msg91.configuration.auth_key, 'Content-Type' => 'application/json' }
    end

    def get(uri, params)
      @base_url.query = URI.encode_www_form(params)
      response = client.get(@base_url + uri)
      JSON.parse(response.read_body)
    end

    def post(_uri, params)
      response = client.post(@base_url, params, @headers)
      JSON.parse(response.read_body)
    end
  end
end
