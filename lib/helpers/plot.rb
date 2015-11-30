module Graph
  class Plot

    attr_reader :label, :coordinates

    delegate :<<, to: :coordinates
    delegate :concat, to: :coordinates
    alias_method :push, :<<

    def initialize(label, coordinates = [])
      @label = label
      @coordinates = coordinates
    end
  end
end