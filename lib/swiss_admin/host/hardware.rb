require 'socket'

module SwissAdmin
  class Host
    def self.cpus
      cpus = if File.readable?("/proc/cpuinfo")
               IO.read("/proc/cpuinfo").scan(/^processor/).size
             else
               "unknown"
             end
    end

    def self.memory
      memory = if File.readable?("/proc/meminfo")
                 IO.read("/proc/meminfo").scan(/([a-zA-Z]+):\W+(\d+)/)
               else
                 "unknown"
               end
    end
  end
end
