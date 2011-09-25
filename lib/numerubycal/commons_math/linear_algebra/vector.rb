module Numerubycal
  module LinearAlgebra
    class Vector
      ArrayRealVector = org.apache.commons.math.linear.ArrayRealVector
      attr_accessor :data

      def initialize(*args)
        if args[0].kind_of?(ArrayRealVector)
          # commons math already does deep copy here
          @data = ArrayRealVector.new(args[0])
        else
          @data = ArrayRealVector.new(args.to_java Java::double)
        end
      end

      def [](index)
        @data.get_entry(index) 
      end

      def []=(index, value)
        @data.set_entry(index,value) 
      end

      def +(other)
        Vector.new(@data.add other.data)
      end

      def add!(other)
        check_dimension! other

        # Use the underlying array reference because we
        # do not want allocate any new memory or objects here.
        self_java_array  = @data.get_data_ref
        other_java_array = other.data.get_data_ref

        0.upto(dimension-1) do |i|
          self_java_array[i] += other_java_array[i]
        end
      end

      def -(other)
        Vector.new(@data.subtract other.data)
      end

      def subtract!(other)
        check_dimension! other

        # Use the underlying array reference because we
        # do not want allocate any new memory or objects here.
        self_java_array  = @data.get_data_ref
        other_java_array = other.data.get_data_ref

        0.upto(dimension-1) do |i|
          self_java_array[i] -= other_java_array[i]
        end
      end

      def identical?(other)
        @data.equals other.data
      end

      def dimension
        @data.dimension
      end

      def to_s
        "(#{@data.get_data.join(", ")})"
      end

      def inspect
        to_s
      end

      protected
      def check_dimension!(other)
        unless check_dimension(other)
          raise DimensionMissmatchError, "Dimension missmatch, got #{self.dimension} and #{other.dimension}, have to be the same."
        end
      end

      def check_dimension(other)
        self.dimension == other.dimension
      end
    end
  end
end
