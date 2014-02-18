require "thor"
module SwissAdmin
  class CLI < Thor
    desc "host SUBCOMMAND", "Returns information about the host"
    subcommand "host", SwissAdmin::Commands::Host

    desc "hardware SUBCOMMAND", "Returns information about host hardware"
    subcommand "hardware", SwissAdmin::Commands::Hardware
    
    desc "network SUBCOMMAND", "Returns information about host network"
    subcommand "network", SwissAdmin::Commands::Network

    desc "user SUBCOMMAND", "Returns information about user(s) on host"
    subcommand "user", SwissAdmin::Commands::User
  end
end
