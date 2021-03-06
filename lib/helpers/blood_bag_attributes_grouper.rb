class BloodBagAttributesGrouper

  def initialize(blood_bag_attributes)
    @blood_bag_attributes = blood_bag_attributes
  end

  def groups
    groups = []
    groups_hash = @blood_bag_attributes.map {
        |blood_bag_attribute|
        { key: blood_bag_attribute.bbat_BloodAttrMinAfterStart, label: label(blood_bag_attribute.bbat_BloodAttrMinAfterStart)}
    }.uniq.sort_by { |group| group[:key]}
    groups_hash.each do |group_hash|
      attribute_group = AttributeGroup.new(group_hash[:key], group_hash[:label])
      attribute_group.concat(blood_bag_attributes(after_start: group_hash[:key]))
      groups << attribute_group
    end
    groups
  end

  def attributes
    attributes = []
    attributes_hash = @blood_bag_attributes.map {
        |blood_bag_attribute| blood_bag_attribute.bbat_BloodAttributeName
    }.uniq
    attributes_hash.each do |attribute|
      attribute_group = AttributeGroup.new(attribute, nil)
      attribute_group.concat(blood_bag_attributes(attribute_name: attribute))
      attributes << attribute_group
    end
    attributes
  end

  private

  def blood_bag_attributes(options = {})
    if options[:after_start]
      @blood_bag_attributes.select {
          |blood_bag_attribute| blood_bag_attribute.bbat_BloodAttrMinAfterStart == options[:after_start]
      }
    elsif options[:attribute_name]
        @blood_bag_attributes.select {
            |blood_bag_attribute| blood_bag_attribute.bbat_BloodAttributeName == options[:attribute_name]
        }
    else
      @blood_bag_attributes
    end
  end

  def label(after_start)
    label = case after_start
      when 0 then 'Start'
      when 9999 then 'End'
      else after_start.to_s
    end
  end
end