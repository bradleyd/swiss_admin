require "thor"
require "swiss_admin/formatter"
module SwissAdmin
  module Commands
    class Hardware < Thor
      namespace :hardware
      class_option :format, :aliases => "-f", :desc => "Format the output", :default => "text"

      desc "cpus", "Number of cpu's"
      def cpus
        Formatter.output(SwissAdmin::Hardware.cpus, options[:format])
      end

      desc "memory", "memory for host"
      def memory
        Formatter.output(SwissAdmin::Hardware.memory, options[:format])
      end
    end
  end
end

