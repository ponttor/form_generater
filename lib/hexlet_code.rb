# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder.rb'

module HexletCode
  # autoload(:FormBuilder, 'hexlet_code/form_builder.rb')

  def self.form_for(user, options = {})
    url = options[:url] || '#' 
    final_options = {'action': url, 'method': 'post'}   
    form_builder = FormBuilder.new(user, final_options)
    yield form_builder if block_given?
    form_builder.final
  end
end

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

result = HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

puts result

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
# </form>
