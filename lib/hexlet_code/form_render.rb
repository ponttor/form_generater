# frozen_string_literal: true

module HexletCode
  class FormRender
    # attr_accessor :result
    # state
    def self.build(form_builder, options)
      result = []
      tag_rules = { default: 'input', text: 'textarea' }

      form_builder.each do |el|
        options_rules = { textarea: { cols: '20', rows: '40', name: el[:param].to_s },
                          input: { name: el[:param].to_s, type: 'text', value: el[:block] } }

        if el[:label_status]
          label_tag = 'label'
          label_options = { for: el[:param].to_s }
          label_block = el[:param].capitalize.to_s
          result.push(Tag.build(label_tag, label_options) { label_block })
        end

        tag_final = tag_rules[el[:tag].to_sym]

        options_default = options_rules[tag_final.to_sym] || {}

        option_content_final = options_default.merge(el[:option_content])
        block_final = el[:block]

        result.push(Tag.build(tag_final, option_content_final) { block_final })
      end
      p @form_tag
      Tag.build('form', options) { result.join }
    end
  end
end
