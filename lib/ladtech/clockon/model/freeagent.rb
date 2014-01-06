$LOAD_PATH.unshift("#{__dir__}")
require 'ladtech/clockon/utils'
require 'freeagent/entity'
require 'freeagent/user'

module FreeAgent
  extend Ladtech::Clockon::Utils::MethodBuilder

  def self.url url=nil
    return @url unless url
    return @url
  end
end