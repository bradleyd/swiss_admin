require "shelltastic"
module SwissAdmin
  class Host
    def self.name
      hostname = Socket.gethostname
      SwissAdmin::Utils::FormatGenerator.build(json: JSON.generate({"hostname" => hostname}), raw: hostname, table: [{"hostname" => hostname}])
    end

    def self.loadavg
      data = Hash[:json, "", :raw, "", :table, [[]]]
      if File.readable?("/proc/loadavg")
        result = IO.read("/proc/loadavg")
        m = result.match(/(?<one>[\d.]+)\W(?<five>[\d.]+)\W(?<fifteen>[\d.]+)/)
        json_out = JSON.generate({"1minute" => m[:one], "5minute" => m[:five], "15minute" => m[:fifteen]})
        table_out = [{"1minute" => m[:one], "5minute" => m[:five], "15minute" => m[:fifteen]}]
        SwissAdmin::Utils::FormatGenerator.build(json: json_out, raw: result, table: table_out)
      else
        result = ::ShellTastic::Command.run("uptime").first
        output = result[:output]
        m = output.match(/load averages?:\W(?<one>[\d.]+)\W+(?<five>[\d.]+)\W+(?<fifteen>[\d.]+)/)
        json_out  = JSON.generate({"1minute" => m[:one], "5minute" => m[:five], "15minute" => m[:fifteen]})
        table_out = [{"1minute" => m[:one], "5minute" => m[:five], "15minute" => m[:fifteen]}]
        SwissAdmin::Utils::FormatGenerator.build(json: json_out, raw: output, table: table_out)
      end
    end
  end
end
