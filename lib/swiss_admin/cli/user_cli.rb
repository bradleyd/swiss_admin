require "thor"
module SwissAdmin
  module Commands
    class User < Thor
      namespace :user

      desc "current", "Current user"
      def current
        $stdout.puts SwissAdmin::User.current
      end

      desc "home", "Current user's home directory"
      def home
        $stdout.puts SwissAdmin::User.home
      end

      desc "active", "All active users"
      def active
        $stdout.puts SwissAdmin::User.active[:output]
      end

    end
  end
end

