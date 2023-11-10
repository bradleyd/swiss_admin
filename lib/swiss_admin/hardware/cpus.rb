require "os"
require "swiss_admin/utils/format_generator"
module SwissAdmin
  class Hardware
    def self.cpus
      cpus = if File.readable?("/proc/cpuinfo")
               IO.read("/proc/cpuinfo").scan(/^processor/).size
             else
               OS.cpu_count
             end

      SwissAdmin::Utils::FormatGenerator.build(json: JSON.generate({"cpus" => cpus}), raw: cpus, table: [{"cpus" => cpus}])
    end
  end
end
