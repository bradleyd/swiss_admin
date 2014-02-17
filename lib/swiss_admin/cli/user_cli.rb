require "thor"
module SwissAdmin
  class User < Thor
    desc "current", "Current user"
    def current
      $stdout.puts SwissAdmin::User.current
    end

    desc "home", "Current user's home directory"
    def home
      $stdout.puts SwissAdmin::User.home
    end
  end
end

