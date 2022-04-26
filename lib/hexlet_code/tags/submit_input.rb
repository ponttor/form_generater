# frozen_string_literal: true

module HexletCode
  module Tags
    class SubmitInput
      def self.build(element)
        value = element[:param]
        options = { name: 'commit', type: 'submit', value: value }
        block = ''

        Tag.build('input', options) { block }
      end
    end
  end
end
