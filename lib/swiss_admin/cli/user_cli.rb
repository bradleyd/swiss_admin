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
    end
  end
end

