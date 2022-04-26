# frozen_string_literal: true

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormRender, 'hexlet_code/form_render.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Tags, 'hexlet_code/tags.rb')

  def self.form_for(entity, options = {})
    url = options[:url] || '#'
    form_method = options[:method] || 'post'
    rest_options = options.except(:url, :method)
    default_options = { action: url, method: form_method }
    final_options = default_options.merge(rest_options)

    form_builder = FormBuilder.new(entity)
    yield form_builder if block_given?
    FormRender.build(form_builder.contents, final_options)
  end
end
