require 'spec_helper'

describe Yeah::Color do
  let(:klass) { Yeah::Color }
  let(:instance) { klass.new }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it { method.call.should be_instance_of klass }

    it "creates an internal reference to an RGBA hex string repr. black" do
      instance.instance_variables.should include :@hex_string
      hex_string = instance.instance_variable_get(:@hex_string)
      hex_string.should eq '000000FF'
    end

    it "uses first argument as hex string" do
      hex_string = (1..8).map { Random.rand(16).to_s(16) }.join
      color = method.call(hex_string)
    end
  end
end
