# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  class Tag
    def self.build(name, options = nil)
      return %(<#{name}>) if options.nil?

      contents = options.map do |type, value|
        %(#{type}="#{value}")
      end
      %(<#{name} #{contents.join(' ')}>)
    end
  end
end

# puts HexletCode::Tag.build('br', a: 'b', c: 'd')
# puts HexletCode::Tag.build('br')
