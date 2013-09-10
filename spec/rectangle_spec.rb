require 'spec_helper'

describe Yeah::Rectangle do
  let(:klass) { Yeah::Rectangle }
  let(:instance) { klass.new }

  it { klass.should be_kind_of Class }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it { method.call.should be_instance_of Yeah::Rectangle }

    it "assigns Vector first argument as #size" do
      vector = Yeah::Vector[Random.rand(40)]
      method.call(vector).size.should eq vector
    end

    it "assigns second argument RGBA byte array as #color" do
      byte_array = (1..4).map { Random.rand(255) }
      method.call(Yeah::Vector[], byte_array).color.should eq byte_array
    end
  end

  describe '#size' do
    subject(:size) { instance.size }

    it { should eq Yeah::Vector[] }
  end

  describe '#size=' do
    subject(:method) { instance.method(:size=) }

    it_behaves_like 'writer', Yeah::Vector[Random.rand(40)]
  end

  describe '#color' do
    subject(:color) { instance.color }

    it { should eq [255, 255, 255, 255] }
  end

  describe '#color=' do
    subject(:method) { instance.method(:color=) }

    it_behaves_like 'writer', [Random.rand(255)]*4
  end
end
