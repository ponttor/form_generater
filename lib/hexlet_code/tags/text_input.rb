# frozen_string_literal: true

module HexletCode
  class TextInput
    def self.build(element)
      tag = 'textarea'
      options_default = { cols: '20', rows: '40', name: element[:param].to_s }
      options = options_default.merge(element[:option_content])
      block = element[:block]

      { tag: tag, options: options, block: block }
    end
  end
end
