require 'httparty'
module FreeAgent
  module Entity
    extend Ladtech::Clockon::Utils::MethodBuilder

    def self.extended clazz
      clazz.send(:include, HTTParty)
    end

    attr_reader :url

    builder_method :entity

    def find options
      #, headers: {'Authorization' => "Bearer #{File.read('.data_access_token')}", 'User-Agent' => 'faraday'}
      get("#{FreeAgent.url}/#{entity}", headers: {'Authorization' => "Bearer "})
    end
  end
end
