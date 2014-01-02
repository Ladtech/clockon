module Ladtech
  module Clockon
    module Runtime
      def app_port
        ENV['port'] || 9292
      end

      def log_file
        File.open(ENV['log'], 'r') if ENV['log']
      end
    end
  end
end

World Ladtech::Clockon::Runtime