require 'spec_helper'

describe Yeah::Color do
  let(:klass) { Yeah::Color }
  let(:instance) { klass.new }

  it { klass.should be_kind_of Class }

  [:new, :[]].each do |method_name|
    describe "::#{method_name}" do
      subject(:method) { klass.method(method_name) }

      it { method.call.should be_instance_of klass }
      it { method.call.byte_array.should eq [0, 0, 0, 255] }
      it { method.call([10, 20, 30, 40]).byte_array.should eq [10, 20, 30, 40] }
      it { method.call([55, 25, 55, 25]).byte_array.should eq [55, 25, 55, 25] }
    end
  end

  describe '#byte_array' do
    subject(:byte_array) { instance.byte_array }

    it { should eq [0, 0, 0, 255] }
  end

  describe '#byte_array=' do
    subject(:method) { instance.method(:byte_array=) }

    it "assigns #byte_array" do
      byte_array = (1..4).map { Random.rand(255) }
      method.call byte_array
      instance.byte_array.should eq byte_array
    end
  end
end
