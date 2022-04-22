# frozen_string_literal: true

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormRender, 'hexlet_code/form_render.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Tags, 'hexlet_code/tags.rb')

  def self.form_for(entity, options = {})
    url = options[:url] || '#'
    atribute = options[:method] || 'post'
    final_options = { action: url, method: atribute }

    form_builder = FormBuilder.new(entity)
    yield form_builder if block_given?
    FormRender.build(form_builder.contents, final_options)
    FormRender.build(form_builder.contents, final_options)
  end
end
