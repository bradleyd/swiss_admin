require "thor"
#require_relative "host_cli"
#require_relative "hardware_cli"
#require_relative "network_cli"
#require_relative "user_cli"
module SwissAdmin
  class CLI < Thor
    desc "host SUBCOMMAND", "Returns information about the host"
    subcommand "host", Host

    desc "hardware SUBCOMMAND", "Returns information about host hardware"
    subcommand "hardware", Hardware
    
    desc "network SUBCOMMAND", "Returns information about host network"
    subcommand "network", Network

    desc "user SUBCOMMAND", "Returns information about user(s) on host"
    subcommand "user", User
  end
end
