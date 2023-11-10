module SwissAdmin
  module Utils
    module FormatGenerator
      def self.build(json:, raw:, table:)
        Hash[:json, json, :raw, raw, :table, table]
      end
    end
  end
end