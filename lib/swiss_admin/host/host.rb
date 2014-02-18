module SwissAdmin
  class Host
    def self.name
      Socket.gethostname
    end

    def self.loadavg
      loadavg = if File.readable?("/proc/loadavg")
                  IO.read("/proc/loadavg")
                else
                  "unknown"
                end
    end
  end
end
