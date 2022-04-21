# frozen_string_literal: true

module HexletCode
  module Tags
    class StringInput
      def self.build(element)
        tag = 'input'
        options_default = { name: element[:param].to_s, type: 'text', value: element[:block] }
        options = options_default.merge(element[:option_content])
        block = element[:block]

        { tag: tag, options: options, block: block }
      end
    end
  end
end
