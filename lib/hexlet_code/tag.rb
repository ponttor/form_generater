module HexletCode
  class Tag
    def self.build(name, options = {})
      single_tags = %w[br img input]
      contents = options.map do |type, value|
        %(#{type}="#{value}")
      end
      if single_tags.include?(name)
        return %(<#{name}>) if contents.empty?

        return %(<#{name} #{contents.join(' ')}>)
      end
      return %(<#{name}>#{yield}</#{name}>) if contents.empty? && block_given?
      return %(<#{name} #{contents.join(' ')}>#{yield}</#{name}>) if block_given?
      return %(<#{name}></#{name}>) if contents.empty?

      %(<#{name} #{contents.join(' ')}>)
    end
  end
end
