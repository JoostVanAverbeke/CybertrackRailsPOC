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

  def is_numeric?
    numeric = nil
    @attributes.each do |attribute|
      if !attribute.is_numeric?
        numeric = false
        break
      else
        numeric = true
      end
    end
    numeric.nil? || !numeric ? false : true
  end

  def coordinates
    coordinates = []
    if is_numeric?
      @attributes.each do |attribute|
        if !attribute.bbat_ExtraInfo.blank? && attribute.bbat_BloodAttrMinAfterStart
          coordinates << [ attribute.bbat_BloodAttrMinAfterStart, attribute.bbat_ExtraInfo.to_f]
        end
      end
     end
    coordinates
  end

  def coordinates?
    coordinates.length > 0
  end
end