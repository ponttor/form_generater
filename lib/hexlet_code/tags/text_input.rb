# frozen_string_literal: true

module HexletCode
  module Tags
    class TextInput
      def self.build(element)
        options_default = { cols: '20', rows: '40', name: element[:param].to_s }
        options = options_default.merge(element[:option_content])
        block = element[:block]

        Tag.build('textarea', options) { block }
      end
    end
  end
end
