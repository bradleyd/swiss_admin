require 'socket'

module SwissAdmin
  class Host
    def self.name
      Socket.gethostname
    end
  end
end
