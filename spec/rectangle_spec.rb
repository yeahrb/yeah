require 'spec_helper'

describe Yeah::Rectangle do
  let(:klass) { Yeah::Rectangle }
  let(:instance) { klass.new }

  it { klass.should be_kind_of Class }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it { method.call.should be_instance_of Yeah::Rectangle }
  end

  describe '#size' do
    subject(:size) { instance.size }

    it { should eq Yeah::Vector[] }
  end

  describe '#size=' do
    subject(:method) { instance.method(:size=) }

    it "assigns Vector value" do
      vector = Yeah::Vector[Random.rand(40)]
      method.call(vector)
      instance.size.should eq vector
    end
  end
end
