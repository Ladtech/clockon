module Ladtech
  module Clockon
    class App < Sinatra::Base
      configure do
        register Sinatra::Reloader
      end
    end
  end
end