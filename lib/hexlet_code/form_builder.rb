# frozen_string_literal: true

module HexletCode
  
  class FormBuilder

    def initialize(user, options)
      @user = user
      @options = options
      @contents = []
    end

    def input param, as = {}
      @contents.push(Tag.build('label', {'for': "#{param}"}) {"#{param.capitalize}"})
      @contents.push(Tag.build('textarea', {cols: '20', rows: '40', name: "#{param}"}) {"#{@user.job}"}) if as != {}
      @contents.push(Tag.build('input', {name: 'name', type: 'text', value: "#{param}"})) if as == {}      
    end

    def submit param = 'save'
      @contents.push(Tag.build('input', {'name': "commit", 'type': "submit", value: "#{param.capitalize}"}))
      Tag.build('input', {'name': "commit", 'type': "submit", value: "#{param.capitalize}"})
    end

    def final
      Tag.build('form', @options) {@contents.join('')}
    end
  end
end
