require "thor"
require "swiss_admin/formatter"
module SwissAdmin
  module Commands
    class Hardware < Thor
      namespace :hardware

      desc "cpus", "Number of cpu's"
      def cpus
        $stdout.puts SwissAdmin::Hardware.cpus
      end

      desc "memory", "memory for host"
      method_option :format, :aliases => "-f", :desc => "Format the output", :default => "text"
      def memory
        Formatter.output(SwissAdmin::Hardware.memory, options[:format])
      end
    end
  end
end

