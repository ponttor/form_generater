# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :contents

    def initialize(entity)
      @entity = entity
      @contents = []
      @default_tag = :string
      @submit_tag = :submit
    end

    def input(param, options = {})
      param_value = @entity.public_send(param)

      tag_type = options.select { |key, _value| key == :as }
      tag = tag_type[:as] || @default_tag
      options_final = options.except(:as) || {}

      result = { label_status: true, tag: tag, option_content: options_final, param: param, block: param_value }
      @contents.push(result)
    end

    def submit
      result = { submit: true, tag: @submit_tag }
      @contents.push(result)
    end
  end
end
