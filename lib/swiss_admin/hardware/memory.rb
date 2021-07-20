
module SwissAdmin
  class Hardware
    # @example
    # Mem — Displays the current state of physical RAM in the system, 
    #  including a full breakdown of total, used, free, shared, buffered, 
    #  and cached memory utilization in bytes.
    # Swap — Displays the total, used, and free amounts of swap space, in bytes.
    # MemTotal — Total amount of physical RAM, in kilobytes.
    # MemFree — The amount of physical RAM, in kilobytes, left unused by the system.
    # MemShared — Unused with 2.4 and higher kernels 
    #  but left in for compatibility with earlier kernel versions.
    # Buffers — The amount of physical RAM, in kilobytes, used for file buffers.
    # Cached — The amount of physical RAM, in kilobytes, used as cache memory.
    # Active — The total amount of buffer or page cache memory, in kilobytes, that is in active use.
    # Inact_dirty — The total amount of buffer or cache pages, in kilobytes, that might be freeable.
    # Inact_clean — The total amount of buffer or cache pages in kilobytes
    # Inact_target — The net amount of allocations per second, in kilobytes, averaged over one minute.
    # HighTotal and HighFree — The total and free amount of memory, 
    #  respectively, that is not directly mapped into kernel space. 
    #  The HighTotal value can vary based on the type of kernel used.
    # LowTotal and LowFree — The total and free amount of memory, respectively, 
    #   that is directly mapped into kernel space. 
    #   The LowTotal value can vary based on the type of kernel used.
    # SwapTotal — The total amount of swap available, in kilobytes.
    # SwapFree — The total amount of swap free, in kilobytes.
    def self.memory
      memory = if File.readable?("/proc/meminfo")
                 IO.read("/proc/meminfo").scan(/([a-zA-Z]+):\W+(\d+)/)
               else
                 return {"unknown"=>0}
               end
      memory.inject({}) { |a,d| a[d[0]] = d[1]; a }
    end
  end
end
