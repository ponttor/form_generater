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

      tag_rules = { :text => 'textarea' }

      if !as_param.empty?
        as = as_param.select {|key, value| key == :as}
        tag_options = as_param.select {|key, value| key != :as}
        tag_default = { cols: '20', rows: '40', name: param.to_s }
        tag_options_all = tag_default.merge(tag_options)
        tag_final = as.empty? ? 'input' : tag_rules[as[:as]]
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
