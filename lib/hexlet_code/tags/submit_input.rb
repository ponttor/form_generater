# frozen_string_literal: true

module HexletCode
  module Tags
    class SubmitInput
      def self.build(element = '')
        tag = 'input'
        options = { name: 'commit', type: 'submit', value: 'Save' }

        { tag: tag, options: options, block: element }
      end
    end
  end
end
