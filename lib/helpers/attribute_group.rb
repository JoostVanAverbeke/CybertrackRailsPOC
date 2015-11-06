class AttributeGroup

  attr_reader :key, :label, :attributes
  delegate :<<, to: :attributes
  delegate :concat, to: :attributes
  alias_method :push, :<<

  def initialize(key, label)
    @key = key
    @label = label
    @attributes = []
  end
end