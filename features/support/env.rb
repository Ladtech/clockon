Bundler.require :test
$LOAD_PATH.unshift("#{__dir__}/../../helpers")
require 'freeagent'

After do |scenario|
  log_content = log_file.read if log_file
  warn "Application output: \n #{log_content}" if scenario.failed? && log_content
end