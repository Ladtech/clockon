$LOAD_PATH.unshift("#{__dir__}/../helpers")
Bundler.require :test

require 'rack/runner'
Cucumber::Rake::Task.new(:features) do |task|
  app = Rack::Runner.start("#{__dir__}/../config.ru")
  task.cucumber_opts="port=#{app.port} log=#{app.log.path}"

  at_exit do
    app.stop
  end
end