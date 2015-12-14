require 'plot'

module BloodBagAttributesHelper
  def jsonify(blood_bag_attributes)
    blood_bag_attributes.map(&:serializable_hash).to_json
  end

  def parameters_label(label)
    "#{label}"
  end

  def anchor_href(label)
    "\##{label}"
  end

  def graph_plots(blood_bag_attributes)
    plots = []
    grouper = BloodBagAttributesGrouper.new(blood_bag_attributes)
    grouper.attributes.each do |attribute|
        if attribute.coordinates?
          plot = Graph::Plot.new(attribute.key, attribute.coordinates)
          plots << plot
        end
    end
    plots
  end

  def graph_plots?(blood_bag_attributes)
    graph_plots(blood_bag_attributes).length > 0
  end

end
