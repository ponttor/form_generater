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
      if as_param != {}
        @contents.push(Tag.build('textarea', { cols: '20', rows: '40', name: param.to_s }) do
                         @user.job.to_s
                       end)
      end
      @contents.push(Tag.build('input', { name: 'name', type: 'text', value: param.to_s })) if as_param == {}
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
