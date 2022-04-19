# frozen_string_literal: true

require_relative 'tags/text_input'
require_relative 'tags/submit_input'
require_relative 'tags/string_input'
require_relative 'tags/label'

module HexletCode
  # autoload(:StringInput, 'tags/string_input')
  # autoload(:TextInput, 'tags/text_input')
  # autoload(:Label, 'tags/input.rb')
  # autoload(:SubmitInput, 'tags/submit_input')

  class FormRender
    def self.build(form_builder, options)
      result = []

      form_builder.each do |element|
        if element[:label_status]
          content = Label.build element
          result.push(Tag.build(content[:tag], content[:options]) { content[:block] })
        end

        klass_name = "HexletCode::#{element[:tag].to_s.capitalize}Input"
        klass = Object.const_get klass_name
        content = klass.build element

        result.push(Tag.build(content[:tag], content[:options]) { content[:block] })
      end
      Tag.build('form', options) { result.join }
    end
  end
end
