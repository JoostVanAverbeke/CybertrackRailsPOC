module BloodBagAttributesHelper
  def jsonify(blood_bag_attributes)
    blood_bag_attributes.map(&:serializable_hash).to_json
  end
end
