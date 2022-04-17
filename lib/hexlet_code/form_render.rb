# frozen_string_literal: true

require_relative 'tags/text'
require_relative 'tags/input'
require_relative 'tags/label'
require_relative 'tags/submit'

module HexletCode
  # autoload(:Input, 'tags/input.rb')
  # autoload(:Text, 'tags/input.rb')
  # autoload(:Label, 'tags/input.rb')
  # autoload(:Input, 'tags/input.rb')

  class FormRender
    def self.build(form_builder, options)
      result = []

      form_builder.each do |element|
        if element[:label_status]
          content = Label.build element
          result.push(Tag.build(content[:tag], content[:options]) { content[:block] })
        end
        p element[:tag]
        content = Input.build element if element[:tag] == 'input' || (element[:tag].nil? && element[:submit].nil?)
        content = Submit.build if element[:submit]
        content = Text.build element if element[:tag] == :text

        result.push(Tag.build(content[:tag], content[:options]) { content[:block] })
      end
      Tag.build('form', options) { result.join }
    end
  end
end
