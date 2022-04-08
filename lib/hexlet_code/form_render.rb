# frozen_string_literal: true

module HexletCode
  class FormRender
    # attr_accessor :result

    def self.build(form_builder, options)
      result = []
      form_builder.each do |el|
        result.push(Tag.build(el[:tag], el[:option_content]) { el[:param] })
      end
      Tag.build('form', options) { result.join }
    end
  end
end
