require "os"
module SwissAdmin
  module Utils
    class OS
      def self.platform
        ::OS.host_os
      end

      def self.info
        YAML.load(OS.report)
      end

      def self.container?
        ::OS::Underlying.docker?
      end
    end
  end
end
