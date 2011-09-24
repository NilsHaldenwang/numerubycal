describe Vector do
  let(:v) { Vector.new(1,2,3) }

  it "should create from an array" do
    v[0].should eql(1.0)
    v[1].should eql(2.0)
    v[2].should eql(3.0)
  end

  describe "#add" do
    it "should perform vector addition if the argument is a vector" do
      v2 = Vector.new(1,2,3)
      (v + v2).should be_identical(Vector.new(2,4,6))
    end  
  end

  it "should compare to vectors for identity of values with identical?" do
    v.identical?(Vector.new(1,2,3)).should be_true
  end

  it "should set values correctly through []=" do
    v[0] = 10
    v[0].should == 10
  end

end
