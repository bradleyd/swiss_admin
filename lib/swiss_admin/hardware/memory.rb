
module SwissAdmin
  class Hardware
    def self.memory
      memory = if File.readable?("/proc/meminfo")
                 IO.read("/proc/meminfo").scan(/([a-zA-Z]+):\W+(\d+)/)
               else
                 "unknown"
               end
    end
  end
end
