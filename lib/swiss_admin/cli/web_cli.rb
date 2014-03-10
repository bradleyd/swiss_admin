require "thor"
require "swiss_admin/web/app"
module SwissAdmin
  module Commands
    # @todo move to another module Commands::Helpers??
    def self.app_running? pid
      pid = pid.to_i
      result = begin
                 Process.kill(0, pid)
                 :running
               rescue Errno::EPERM => e
                 e.message
               rescue Errno::ESRCH => e
                 :not_running
               rescue
                 "Unable to determine status for #{pid} : #{$!}"
               end
      result
    end

    class Web < Thor
      namespace :web

      desc "start", "Start web server"
      method_option :pid_file, default: "/tmp/swissadmin.pid"
      method_option :port, default: 8080
      def start
        $stdout.puts "Starting..."
        Rack::Server.start(app: SwissAdmin::HostInfo, 
                           daemonize: true, 
                           pid: options[:pid_file],
                           Port: options[:port])
      end

      # @todo need to break out all the file to separate module
      desc "stop", "Stop web server"
      def stop
          pid = IO.read("/tmp/swissadmin.pid")
          res = Commands.app_running? pid
          if res == :running
            Process.kill("HUP",pid.to_i)
          end
          File.delete("/tmp/swissadmin.pid")
          $stdout.puts "Stopped" || res != :running
      end
    end
  end
end

