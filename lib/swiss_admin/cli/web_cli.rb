require "thor"
require "swiss_admin/web/app"
module SwissAdmin
  module Commands
    # @todo move to another module Commands::Helpers??
    def self.app_running?(pid)
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
      method_option :pid_file, aliases: "-P", desc: "Set path for pid file", default: "/tmp/swissadmin.pid"
      method_option :debug, aliases: "-d", type: :boolean, desc: "debug", default: false
      method_option :port, aliases: "-p", desc: "Set port for web companion", default: "8080"
      def start
        $stdout.puts "Starting server on #{options["port"]}"
        Rack::Server.start(app: SwissAdmin::HostInfo,
                           daemonize: true, 
                           debug: options[:debug] || false,
                           pid: options[:pid_file] || "/tmp/swissadmin.pid",
                           Port: options[:port])
      end

      # @todo need to break out all the file to separate module
      desc "stop", "Stop web server"
      def stop
        begin
          pid = IO.read("/tmp/swissadmin.pid")
          res = Commands.app_running? pid
          if res == :running
            Process.kill("HUP",pid.to_i)
          end
          File.delete("/tmp/swissadmin.pid")
          $stdout.puts "Stopped" || res != :running
        rescue Errno::ENOENT => e
          $stdout.puts e.message
          return 0
        end
      end

      desc "status", "Get status of the web server"
      def status
        running = false
        if File.exist?("/tmp/swissadmin.pid")
          pid = IO.read("/tmp/swissadmin.pid")
          res = Commands.app_running? pid
          running = true if res == :running
        end
        $stdout.puts (running ? "Running" : "Not Running")
      end
    end
  end
end

