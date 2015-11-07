module BloodBagAttributesHelper
  def jsonify(blood_bag_attributes)
    blood_bag_attributes.map(&:serializable_hash).to_json
  end

  def parameters_label(label)
    "Parameters: #{label}"
  end

  def anchor_href(label)
    "\##{label}"
  end
end
