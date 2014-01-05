$LOAD_PATH.unshift(__dir__)

require 'app/helpers'

module Ladtech
  module Clockon
    class App < Sinatra::Base
      helpers Helpers::User

      get '/register/:user/:date' do
        user(params[:user]).register_timeslip(params[:project], params[:task], params[:date])
      end
    end
  end
end
