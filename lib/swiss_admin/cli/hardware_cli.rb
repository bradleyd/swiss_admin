require "thor"
module SwissAdmin
  class Hardware < Thor
    desc "cpus", "Number of cpu's"
    def cpus
      $stdout.puts SwissAdmin::Host.cpus
    end

    desc "memory", "memory for host"
    def memory
      print_table(SwissAdmin::Host.memory)
    end
  end
end

