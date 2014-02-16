require "thor"
module SwissAdmin
  class Host < Thor
    desc "name", "Hostname"
    def name
      $stdout.puts SwissAdmin::Host.name
    end
  end
end

