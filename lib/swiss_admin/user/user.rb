require "etc"
module SwissAdmin
  class User
    def self.current
      ENV["USER"] || Etc.getlogin    
    end

    def self.home
      Dir.home(Etc.getlogin)
    end
  end
end
