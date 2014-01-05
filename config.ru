$LOAD_PATH.unshift("#{__dir__}/lib")

Bundler.require
Bundler.require :development and require 'ladtech/clockon/app/reloader' if development?
require 'ladtech/clockon/app'

Ladtech::Clockon::App.configure do
  use Rack::CommonLogger

  set :authorization_token, File.read("#{__dir__}/.clockon_token")
end

run Ladtech::Clockon::App