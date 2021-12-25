module Msg91
  class Configuration
    attr_accessor :auth_key
  end

  def initialize
    @auth_key = nil
  end
end
