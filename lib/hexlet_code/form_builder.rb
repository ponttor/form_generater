# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :contents

    def initialize(user)
      @user = user
      @contents = []
    end

    def input(param, options_given = {})
      param_value = @user.public_send(param)
      @contents.push(tag: 'label', option_content: { for: param.to_s }, param: param.capitalize.to_s)

      tag_rules = { text: 'textarea', input: 'input' }
      options_rules = { text: { cols: '20', rows: '40', name: param.to_s },
                        input: { name: param.to_s, type: 'text', value: param_value } }

      if options_given.empty?
        return @contents.push(tag: 'input', option_content: { name: param, type: 'text', value: param_value },
                              param: '')
      end

      as = options_given.select { |key, _value| key == :as }
      options_given = options_given.except(:as)

      options_default = options_rules[as[:as]]
      tag_final = as.empty? ? 'input' : tag_rules[as[:as]]

      tag_option = options_default.merge(options_given)

      @contents.push(tag: tag_final, option_content: tag_option, param: @user[param].to_s)
    end

    def submit(param = 'save')
      @contents.push(tag: 'input', option_content: { name: 'commit', type: 'submit', value: param.capitalize.to_s },
                     param: '')
    end
  end
end
