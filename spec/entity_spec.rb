require 'spec_helper'

describe Yeah::Entity do
  let(:klass) { Yeah::Entity }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '#position' do
    subject(:position) { instance.position }

    it { should be_instance_of Yeah::Vector }
    it { position.components.should eq [0, 0, 0] }
  end

  describe '#position=' do
    it "assigns position" do
      vector = Yeah::Vector[Random.rand(100)]
      instance.position = vector
      instance.position.should eq vector
    end
  end
end
