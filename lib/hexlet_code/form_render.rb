# frozen_string_literal: true

module HexletCode
  class FormRender
    def self.build(form_builder, options)
      result = []

      form_builder.each do |element|
        if element[:label_status]
          content = HexletCode::Tags::Label.build element
          result.push(Tag.build(content[:tag], content[:options]) { content[:block] })
        end

        klass_name = "HexletCode::Tags::#{element[:tag].to_s.capitalize}Input"
        klass = Object.const_get klass_name
        content = klass.build element

        result.push(Tag.build(content[:tag], content[:options]) { content[:block] })
      end
      Tag.build('form', options) { result.join }
    end
  end
end
