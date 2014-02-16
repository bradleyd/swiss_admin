module SwissAdmin
  class Hardware
    def self.cpus
      cpus = if File.readable?("/proc/cpuinfo")
               IO.read("/proc/cpuinfo").scan(/^processor/).size
             else
               "unknown"
             end
    end
  end
end
