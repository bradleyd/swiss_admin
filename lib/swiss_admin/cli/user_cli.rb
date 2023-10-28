require "thor"
module SwissAdmin
  module Commands
    class User < Thor
      namespace :user
      class_option :format, :aliases => "-f", :desc => "Format the output", :default => "text"


      desc "current", "Current user"
      def current
        Formatter.output(SwissAdmin::User.current, options[:format])
      end

      desc "home", "Current user's home directory"
      def home
        Formatter.output(SwissAdmin::User.home, options[:format])
      end

      desc "active", "All active users"
      def active
        Formatter.output(SwissAdmin::User.active, options[:format])
      end
    end
  end
end

