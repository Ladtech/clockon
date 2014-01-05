$LOAD_PATH.unshift("#{__dir__}/../helpers")
Bundler.require :test

require 'rack/runner'

RSpec::Core::RakeTask.new(:spec)

task :features do
  Cucumber::Rake::Task.new(:run_features) do |task|
    app = Rack::Runner.start("#{__dir__}/../config.ru")
    task.cucumber_opts="port=#{app.port} log=#{app.log.path}"

    at_exit{app.stop}
  end

  Rake::Task[:run_features].invoke
end
