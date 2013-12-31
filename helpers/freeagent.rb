require 'oauth2'
module FreeAgent
  class << self
    def client
      @client ||= OAuth2::Client.new('W9uZKVpVJe9-QXgoKrEI2w', '_MrDn-ICcl5LGJHn0rnZRw', :site => 'https://api.sandbox.freeagent.com', token_url: '/v2/token_endpoint', authorize_url: '/v2/approve_app')
    end

    def token code
      client.auth_code.get_token(code, :redirect_uri => 'http://localhost:4567/thing')
    end

    def entity entity
      JSON.parse(HTTParty.get("https://api.sandbox.freeagent.com/v2/#{entity}", headers: {'Authorization' => "Bearer #{File.read('.sandbox_access_code')}", 'User-Agent' => 'faraday'}).body)[entity]
    end

    def user name
      user = entity('users').find{|user_hash| user_hash['first_name'].downcase == name.downcase}
      raise "User #{name} not found" unless user
      user
    end
  end
end