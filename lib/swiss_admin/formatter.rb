require 'formatador'

module SwissAdmin
  module Formatter
    def self.output(data, format)
      case format
      when "text"
        $stdout.puts data[:raw]
      when "json"
        $stdout.puts data[:json]
      when "table"
        $stdout.puts Formatador.display_table(data[:table])
      else
        $stdout.puts data[:raw]
      end
    end
  end
end
