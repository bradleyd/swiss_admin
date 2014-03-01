require "etc"
require "shelltastic"

module SwissAdmin
  class User
    def self.current
      ENV["USER"] || Etc.getlogin    
    end

    def self.home
      Dir.home(Etc.getlogin)
    end

    def self.active
      ::ShellTastic::Command.run("w -s -h").first      
    end
  end
end
