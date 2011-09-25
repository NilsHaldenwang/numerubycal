module Numerubycal
  module LinearAlgebra
    class DimensionMissmatchError < StandardError
    end

    autoload :Vector, "numerubycal/commons_math/linear_algebra/vector"

  end
end

