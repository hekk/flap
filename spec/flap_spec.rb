require "spec_helper"

describe Flap do
  it "Object has flap method" do
    expect(Object).to respond_to(:flap)
  end

  let(:object) { "object" }

  it "returns self" do
    expect(object.flap).to eql object
  end

  it "block binded self context" do
    ret = nil
    object.flap { ret = self }
    expect(ret).to eql object
  end
end
