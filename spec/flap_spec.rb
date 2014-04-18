require "spec_helper"

describe Flap do
  shared_examples_for "xxx_tap_eval" do
    it "has method" do
      expect(subject).to respond_to(meth)
    end

    it "returns self" do
      expect(subject.public_send(meth)).to eql subject
    end

    it "block binded self context" do
      ret = nil
      subject.public_send(meth) { ret = self }
      expect(ret).to eql subject
    end
  end

  describe "instance_eval_tap" do
    subject { Object.new }
    let(:meth) { :instance_eval_tap }
    it_behaves_like "xxx_tap_eval"
  end

  describe "class_eval_tap" do
    subject { Module }
    let(:meth) { :class_eval_tap }
    it_behaves_like "xxx_tap_eval"
  end

  describe ".enable_short_methods!" do
    before do
      Flap.enable_short_methods!
    end

    it "Object has :itap instance method" do
      expect(Object.new).to respond_to(:itap)
    end

    it "Module has :ctap class method" do
      expect(Module).to respond_to(:ctap)
    end
  end

  context "deprecated" do
    let(:meth) { :flap }
    it_behaves_like "xxx_tap_eval"

    it "shows deprecated message" do
      begin
        original = $stderr
        $stderr = result = StringIO.new
        flap
        expect(result.string).to match("deprecated")
      ensure
        $stderr = original
      end
    end
  end
end
