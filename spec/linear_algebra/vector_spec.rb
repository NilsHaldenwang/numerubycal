include Numerubycal::LinearAlgebra

describe Vector do
  let(:v) { Vector.new(1,2,3) }

  it "should compare to vectors for identity of values with identical?" do
    v.identical?(Vector.new(1,2,3)).should be_true
  end

  it "should create from an array" do
    v.should be_identical(Vector.new(1,2,3))
  end

  it "should perform vector addition correctly" do
    v2 = Vector.new(1,2,3)
    (v + v2).should be_identical(Vector.new(2,4,6))
  end  
  
  describe "#subtract!" do
    it "should perform in-place vector subtraction correctly" do
      v2 = Vector.new(1,2,3)
      v.subtract! v2
      v.should be_identical(Vector.new(0,0,0))
    end

    it "should raise error on dimension missmatch" do
      lambda {
        v.subtract!( Vector.new(1,2,3,4) )
      }.should raise_exception(DimensionMissmatchError)
    end
  end

  describe "#add!" do
    it "should perform in-place vector addition correctly" do
      v2 = Vector.new(1,2,3)
      v.add! v2
      v.should be_identical(Vector.new(2,4,6))
    end

    it "should raise error on dimension missmatch" do
      lambda {
        v.add!( Vector.new(1,2,3,4) )
      }.should raise_exception(DimensionMissmatchError)
    end
  end

  it "should perform vector subtraction correctly" do
    v2 = Vector.new(1,2,3)
    (v-v2).should be_identical(Vector.new(0,0,0))
  end

  it "should set values correctly through []=" do
    v[0] = 10
    v[0].should == 10
  end

  it "should return correct dimension" do
    v.dimension.should == 3 
  end

end
