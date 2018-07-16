require "msg91/version"
require "msg91/configuration"
require "msg91/message"
require 'uri'
require 'net/http'
require 'JSON'

module Msg91

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.send_text(text,recepients,sender_id='ORANGE',route='4',country='91')
    auth_key = Msg91.configuration.auth_key
    puts Msg91.configuration
    http = Net::HTTP.new('http://api.msg91.com',80)
    path = '/api/v2/sendsms'
    url = URI("http://api.msg91.com/api/v2/sendsms")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    headers = Hash.new
    headers = {'authkey' => auth_key,'Content-Type' => 'application/json','unicode' => '1'}
    body_string = self.build_hash(sender_id,route,text,recepients,country)
    response = http.post(path,body_string,headers)
    puts response.read_body
  end
end
