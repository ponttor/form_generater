# frozen_string_literal: true

module HexletCode
  module Tags
    class SubmitInput
      def self.build(element)
        tag = 'input'
        options = { name: 'commit', type: 'submit', value: 'Save' }
        block = element || ''

        { tag: tag, options: options, block: block }
      end
    end
  end
end
