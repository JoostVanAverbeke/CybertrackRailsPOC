class BloodBagAttributesGrouper

  def initialize(blood_bag_attributes)
    @blood_bag_attributes = blood_bag_attributes
  end

  def groups
    @blood_bag_attributes.map {
        |blood_bag_attribute|
        { key: blood_bag_attribute.bbat_BloodAttrMinAfterStart, label: label(blood_bag_attribute.bbat_BloodAttrMinAfterStart)}
    }.uniq.sort_by { |group| group[:key]}
  end

  def blood_bag_attributes(after_start)
    @blood_bag_attributes.select { |blood_bag_attribute| blood_bag_attribute.bbat_BloodAttrMinAfterStart == after_start}
  end

  private

  def label(after_start)
    label = case after_start
      when 0 then 'Start'
      when 9999 then 'End'
      else after_start.to_s
    end
  end
end