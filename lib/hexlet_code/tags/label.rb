# frozen_string_literal: true

module HexletCode
  module Tags
    class Label
      def self.build(element)
        tag = 'label'
        options = { for: element[:param].to_s }
        block = element[:param].capitalize.to_s

        { tag: tag, options: options, block: block }
      end
    end
  end
end
