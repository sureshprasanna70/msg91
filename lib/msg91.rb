require 'msg91/version'
require 'msg91/configuration'
require 'msg91/message'
require 'msg91/otp'
require 'msg91/http_client'
require 'uri'
require 'net/http'
require 'json'

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
end
