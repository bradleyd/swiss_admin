require "thor"
module SwissAdmin
  module Commands
    class Host < Thor
      namespace :host

      desc "name", "Hostname"
      def name
        $stdout.puts SwissAdmin::Host.name
      end

      desc "loadavg", "Current system load"
      def loadavg
        $stdout.puts SwissAdmin::Host.loadavg
      end
    end
  end
end

