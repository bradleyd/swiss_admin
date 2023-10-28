require "etc"
require "shelltastic"
require "swiss_admin/utils/os"
require "swiss_admin/utils/format_generator"

module SwissAdmin
  class User
    def self.current
      current_user = ENV["USER"] || Etc.getlogin || Etc.getpwuid.name
      SwissAdmin::Utils::FormatGenerator.build(json: JSON.generate({"current_user" => current_user}), raw: current_user, table: [{"current_user" => current_user}])
    end

    def self.home
      current_user_home = Dir.home(Etc.getlogin)
      SwissAdmin::Utils::FormatGenerator.build(json: JSON.generate({"home" => current_user_home}), raw: current_user_home, table: [{"home" => current_user_home}])
    end

    def self.active
      if SwissAdmin::Utils::OS.container?
        return SwissAdmin::Utils::FormatGenerator.build(json: JSON.generate({"user" => SwissAdmin::User.current}),
        raw: SwissAdmin::User.current[:raw], table: [{"user" => SwissAdmin::User.current}])
      end
      results =
      case SwissAdmin::Utils::OS.platform
      when /linux/
        ::ShellTastic::Command.run("w -s -h").first
      when /darwin/
        ::ShellTastic::Command.run("w -h").first
      else
        ::ShellTastic::Command.run("getend passwd").first
      end
        lines = results[:output].split("\n")
        temp = []
        lines.each do |line|
          temp <<  {"user" => line}
        end
      SwissAdmin::Utils::FormatGenerator.build(json: JSON.generate(temp), raw: results[:output], table: temp)
    end

    def self.parse_user_output(str)
      raw = str.first[:output].split("\n")[1..-1]
      headers = raw[0].split
      h = Hash.new
      res = []
      headers.each do |hd|
        h[hd] = ""
      end
    end
  end
end
