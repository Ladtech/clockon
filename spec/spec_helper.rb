$LOAD_PATH.unshift("#{__dir__}/../lib/ladtech/clockon")
Bundler.require
require 'app'

RSpec.configure do
  include Ladtech::Clockon
end