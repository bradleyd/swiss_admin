require 'socket'

module SwissAdmin
  class Host
    def self.cpus
      File.readable?("/proc/cpuinfo")
      IO.read("/proc/cpuinfo").scan(/^processor/).size
    end
  end
end
