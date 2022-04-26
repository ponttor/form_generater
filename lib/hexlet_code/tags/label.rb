# frozen_string_literal: true

module HexletCode
  module Tags
    class Label
      def self.build(element)
        options = { for: element[:param].to_s }
        block = element[:param].capitalize.to_s

        Tag.build('label', options) { block }
      end
    end
  end
end
