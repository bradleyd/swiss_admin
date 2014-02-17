require "thor"
module SwissAdmin
  class Hardware < Thor
    desc "cpus", "Number of cpu's"
    def cpus
      $stdout.puts SwissAdmin::Hardware.cpus
    end

    desc "memory", "memory for host"
    def memory
      print_table(SwissAdmin::Hardware.memory)
    end
  end
end

