require 'spec_helper'

describe Yeah::Game do
  let(:klass) { Yeah::Game }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::new' do
    it "creates an internal reference to Yeah::Desktop as platform" do
      instance.instance_variables.should include :@platform
      platform = instance.instance_variable_get(:@platform)
      platform.should be_kind_of Yeah::Desktop
    end
  end

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

  describe '#update' do
    it "calls #update of each element in #entities" do
      instance.entities = (1..3).map { DummyEntity.new }
      update_count = Random.rand(5)
      update_count.times { instance.update }

      instance.entities.each { |e| e.update_count.should eq update_count }
    end
  end
end
