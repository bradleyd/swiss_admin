require "thor"
require_relative "host_cli"
module SwissAdmin
  class CLI < Thor
    desc "host SUBCOMMAND", "Returns information about the host"
    subcommand "host", Host
  end
end
