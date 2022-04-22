# frozen_string_literal: true

module HexletCode
  module Tags
    class SubmitInput
      def self.build(element)
        tag = 'input'
        value = element[:param] || 'Save'
        options = { name: 'commit', type: 'submit', value: value }
        block = ''
        { tag: tag, options: options, block: block }
      end
    end
  end
end
