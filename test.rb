require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

require 'oauth2'
set :client, OAuth2::Client.new('86H6oPNQlHUsghvZf9d_kw', '-OGzhLKvmkSsHoZBGYe7oA', :site => 'https://api.sandbox.freeagent.com', token_url: '/v2/token_endpoint', authorize_url: '/v2/approve_app')

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

