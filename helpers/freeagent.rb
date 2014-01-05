require 'oauth2'
module FreeAgent
  APPS = {
      data_access: ['W9uZKVpVJe9-QXgoKrEI2w', '_MrDn-ICcl5LGJHn0rnZRw'],
      clockon: ['86H6oPNQlHUsghvZf9d_kw', '-OGzhLKvmkSsHoZBGYe7oA']
  }
  class << self
    def client client_id, secret
      OAuth2::Client.new(client_id, secret, :site => 'https://api.sandbox.freeagent.com', token_url: '/v2/token_endpoint', authorize_url: '/v2/approve_app')
    end

    def token oauth2_client, code
      oauth2_client.auth_code.get_token(code, :redirect_uri => 'http://localhost:4567/thing')
    end

    def entity entity
      JSON.parse(HTTParty.get("https://api.sandbox.freeagent.com/v2/#{entity}", headers: {'Authorization' => "Bearer #{File.read('.data_access_token')}", 'User-Agent' => 'faraday'}).body)[entity]
    end

    def user name
      user = entity('users').find{|user_hash| user_hash['first_name'].downcase == name.downcase}
      raise "User #{name} not found" unless user
      user
    end
  end
end