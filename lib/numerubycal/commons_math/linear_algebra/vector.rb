module Numerubycal
  class Vector
    ArrayRealVector = org.apache.commons.math.linear.ArrayRealVector
    attr_accessor :data

    def initialize(*args)
      if args[0].kind_of?(ArrayRealVector)
        @data = args[0]
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
      if other.kind_of? Vector
        Vector.new(@data.add other.data)
      end
    end

    def identical?(other)
      @data.equals other.data
    end

    def to_s
      @data.get_data.join(", ")
    end

    def inspect
      to_s
    end
  end
end
