require "thor"
require "swiss_admin/formatter"

module SwissAdmin
  module Commands
    class Host < Thor
      namespace :host

      desc "name", "Hostname"
      def name
        $stdout.puts SwissAdmin::Host.name
      end

      desc "loadavg", "Current system load"
      method_option :format, :aliases => "-f", :desc => "Format the output", :default => "text"
      def loadavg
        Formatter.output(SwissAdmin::Host.loadavg, options[:format])
      end
    end
  end
end
