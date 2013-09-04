require 'spec_helper'

describe Yeah::Game do
  let(:klass) { Yeah::Game }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '#entities' do
    subject(:entities) { instance.entities }

    it { should eq [] }
  end

  describe '#entities=' do
    it "assigns #entities" do
      value = [Yeah::Entity.new(Random.rand(100))]
      instance.entities = value
      instance.entities.should eq value
    end
  end
end
