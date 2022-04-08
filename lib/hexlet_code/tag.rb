# frozen_string_literal: true

module HexletCode
  class Tag
    def self.create_attributes_string(options)
      attributes = options.map do |type, value|
        %(#{type}="#{value}")
      end

      options.empty? ? '' : %( #{attributes.join(' ')})
    end

    def self.build(name, options = {})
      single_tags = %w[br img input]

      content = block_given? ? yield : ''

      if single_tags.include?(name)
        %(<#{name}#{create_attributes_string(options)}>)
      else
        %(<#{name}#{create_attributes_string(options)}>#{content}</#{name}>)
      end
    end
  end
end
