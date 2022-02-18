class Tag
  def self.build(name, options)
    contents = []
    options.each do |type, value|
      contents.push(%(#{type}="#{value}"))
    end
    %(<#{name} #{contents.join(' ')}>)
  end
end
