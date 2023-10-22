require "shelltastic"
module SwissAdmin
  class Host
    def self.name
      Socket.gethostname
    end

    def self.loadavg
      data = Hash[:json, "", :raw, "", :table, [[]]]
      if File.readable?("/proc/loadavg")
        result = IO.read("/proc/loadavg")
        data[:raw] = result
        m = result.match(/(?<one>[\d.]+)\W(?<five>[\d.]+)\W(?<fifteen>[\d.]+)/)
        data[:json] = JSON.generate({"1minute" => m[:one], "5minute" => m[:five], "15minute" => m[:fifteen]})
        data[:table] = [{"1minute" => m[:one], "5minute" => m[:five], "15minute" => m[:fifteen]}]
      else
        result = ::ShellTastic::Command.run("uptime").first
        output = result[:output]
        m = output.match(/load averages?:\W(?<one>[\d.]+)\W+(?<five>[\d.]+)\W+(?<fifteen>[\d.]+)/)
        data[:raw] = output
        data[:json] = JSON.generate({"1minute" => m[:one], "5minute" => m[:five], "15minute" => m[:fifteen]})
        data[:table] = [{"1minute" => m[:one], "5minute" => m[:five], "15minute" => m[:fifteen]}]
      end
      data
    end
  end
end
