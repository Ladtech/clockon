require 'bundler/setup'
Dir['tasks/**/*.rake'].each{|tasks| import tasks}

task default: ['freeagent:data_access:generate_access_token', :spec, :features]

