# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  class Tag
    def self.build(name, content)
      contents = []
      content.each do |type, value|
        contents.push(%(#{type}=\"#{value}\"))
      end
      %(<#{name} #{contents.join(' ')}>)
    end
  end
end

p HexletCode::Tag.build('br', a: 'b', c: 'd')
