require "thor"
require "swiss_admin/formatter"

module SwissAdmin
  module Commands
    class Host < Thor
      namespace :host
      class_option :format, :aliases => "-f", :desc => "Format the output", :default => "text"

      desc "name", "Hostname"
      def name
        Formatter.output(SwissAdmin::Host.name, options[:format])
      end

      desc "loadavg", "Current system load"
      def loadavg
        Formatter.output(SwissAdmin::Host.loadavg, options[:format])
      end
    end
  end
end
