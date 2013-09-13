require 'spec_helper'

describe Entity do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it { method.call.should be_instance_of klass }
    it { method.call.position.should eq Vector[0, 0, 0] }
    it { method.call(2, 4, 8).position.should eq Vector[2, 4, 8] }
  end

  describe '#position' do
    subject(:position) { instance.position }

    it { should be_instance_of Vector }
    it { position.components.should eq [0, 0, 0] }
  end

  describe '#position=' do
    subject(:method) { instance.method(:position=) }

    it_behaves_like 'writer', Vector[Random.rand(100)]
  end

  [:x, :y, :z].each do |method_name|
    describe "##{method_name}" do
      it "is #position.#{method_name}" do
        instance.position.send("#{method_name}=", Random.rand(100))
        instance.send(method_name).should eq instance.position.send(method_name)
      end
    end

    describe "##{method_name}=" do
      it "assigns #position.#{method_name}" do
        value = Random.rand(100)
        instance.send("#{method_name}=", value)
        instance.position.send(method_name).should eq value
      end
    end
  end

  describe '#draw' do
    subject(:method) { instance.method(:draw) }

    its(:call) { should eq nil }
  end
end
