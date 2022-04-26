# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :contents

    def initialize(entity)
      @entity = entity
      @contents = []
    end

    def input(param, options = {})
      param_value = @entity.public_send(param)

      tag = options[:as] || :string
      options_final = options.except(:as)

      result = { label_status: true, tag: tag, option_content: options_final, param: param, block: param_value }
      @contents.push(result)
    end

    def submit(value = 'Save')
      result = { tag: :submit, param: value }
      @contents.push(result)
    end
  end
end
