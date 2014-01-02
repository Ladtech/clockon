Bundler.require

module Ladtech
  module Clockon
    class App < Sinatra::Base
      use Rack::CommonLogger
      set :client, OAuth2::Client.new('86H6oPNQlHUsghvZf9d_kw', '-OGzhLKvmkSsHoZBGYe7oA', :site => 'https://api.sandbox.freeagent.com', token_url: '/v2/token_endpoint', authorize_url: '/v2/approve_app')

      configure :development do
        Bundler.require :development
        register Sinatra::Reloader
      end

      helpers do
        def client
          settings.client
        end
      end

      get '/' do
        redirect client.auth_code.authorize_url(:redirect_uri => 'http://localhost:4567/authorized')
      end

      get '/authorized' do
        token = client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:4567/authorized')
        response = token.get('/v2/company')
        response.body
      end
    end
  end
end

run Ladtech::Clockon::App