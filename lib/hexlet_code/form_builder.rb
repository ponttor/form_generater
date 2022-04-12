# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :contents

    def initialize(entity)
      @entity = entity
      @contents = []
      @default_tag = :default
      @default_submit_options = { name: 'commit', type: 'submit' }
    end

    def input(param, options = {})
      param_value = @entity.public_send(param)

      tag_type = options.select { |key, _value| key == :as }
      options_final = options.except(:as) || {}

      tag = tag_type[:as] || @default_tag

      result = { label_status: true, tag: tag, option_content: options_final, param: param, block: param_value }
      @contents.push(result)
    end

    def submit(param = 'save')
      tag = @default_tag
      options_final = { value: param.capitalize.to_s }.merge(@default_submit_options)
      result = { label_status: false, tag: tag, option_content: options_final, param: '', block: '' }
      @contents.push(result)
    end
  end
end
