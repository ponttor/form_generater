# frozen_string_literal: true

module HexletCode
  class SubmitInput
    def self.build(_element)
      tag = 'input'
      options = { name: 'commit', type: 'submit', value: 'Save' }
      block = ''

      { tag: tag, options: options, block: block }
    end
  end
end
