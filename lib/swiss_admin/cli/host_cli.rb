require "thor"
module SwissAdmin
  class Host < Thor
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

