# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, options = {})
      # def stringify_tags(name, options = {})
      #   contents = options.map do |type, value|
      #     %(#{type}="#{value}")
      #   end
      #   %( #{contents.join(' ')})
      # end

      single_tags = %w[br img input]

      tag_contents = options.map do |type, value|
        %(#{type}="#{value}")
      end

      content = block_given? ? yield : ''
      tags_string = %( #{tag_contents.join(' ')})

      if single_tags.include?(name)

        return %(<#{name}>) if tags_string == ' '

        return %(<#{name}#{tags_string}>)
      end

      return %(<#{name}>#{content}</#{name}>) if tags_string == ' '

      %(<#{name}#{tags_string}>#{content}</#{name}>)
    end
  end
end
