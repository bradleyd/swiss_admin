require "thor"
require "swiss_admin/web/app"
module SwissAdmin
  module Commands
    class Web < Thor
      namespace :web

      desc "start", "Start web server"
      def start
        $stdout.puts "Starting..."
        Rack::Server.start(app: SwissAdmin::HostInfo, 
                           daemonize: true, 
                           pid: "/tmp/swiss.pid")
      end

      desc "stop", "Stop web server"
      def stop
        pid=IO.read("/tmp/swiss.pid")
        Process.kill("HUP",pid.to_i)
        $stdout.puts "Stopped"
      end

    end
  end
end

