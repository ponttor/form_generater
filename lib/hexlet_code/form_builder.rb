# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(user, options)
      @user = user
      @options = options
      @contents = []
    end

    def input(param, as_param = {})
      @contents.push(Tag.build('label', { for: param.to_s }) { param.capitalize.to_s })

      tag_rules = { text: 'textarea', input: 'input' }
      options_rules = { text: { cols: '20', rows: '40', name: param.to_s }, input: { name: param, type: 'text', value: @user[param] } }

      unless as_param.empty?
        as = as_param.select { |key, _value| key == :as }
        options_given = as_param.except(:as)

        options_default = as.empty? ? options_rules[:input] : options_rules[as[:as]]
        tag_final = as.empty? ? 'input' : tag_rules[as[:as]]

        tag_options_all = options_default.merge(options_given)
        @contents.push(Tag.build(tag_final, tag_options_all) do
          @user.job.to_s
        end)
      end
      @contents.push(Tag.build('input', { name: param, type: 'text', value: @user[param] })) if as_param.empty?
    end

    def submit(param = 'save')
      @contents.push(Tag.build('input', { name: 'commit', type: 'submit', value: param.capitalize.to_s }))
      Tag.build('input', { name: 'commit', type: 'submit', value: param.capitalize.to_s })
    end

    def final
      Tag.build('form', @options) { @contents.join }
    end
  end
end
