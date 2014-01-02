require 'childprocess'
require 'tempfile'
require 'wait'
module Rack
  class Runner

    attr_accessor :port, :log

    def initialize config_ru, options={}
      @options= options
      @config_ru = config_ru
    end

    def run
      directory = ::File.dirname(@config_ru)

      @log = Tempfile.new('application_log')

      @process = Dir.chdir directory do
        puts "bundle exec thin start -R #{::File.basename(@config_ru)} -p #{port} #{@options[:ssl] == true ? '--ssl' : '' }"
        command = "bundle exec thin start -R #{::File.basename(@config_ru)} -p #{port} #{@options[:ssl] == true ? '--ssl' : '' }".split
        process = ChildProcess.build(*command)
        process.detach=true
        process.io.stdout = @log
        process.io.stderr = @log
        process.start
        Wait.new.until do
          !port_available?(port)
        end
        process
      end
    end

    def port
      return @port if @port
      port = 11000
      until port_available?(port)
        port+=1
      end
      @port = port
    end

    def port_available? port
      `fuser -n tcp #{port}`.empty?
    end

    def stop
      @process.stop
    end

    def running?
      @process.alive?
    end

    class << self
      def start config_ru, options={}
        app = new config_ru, options
        app.run
        ::File.open('application.port', 'w') { |file| file.write(app.port) }
        app
      end
    end
  end
end