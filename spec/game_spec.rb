require 'spec_helper'

describe Yeah::Game do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::new' do
    it "creates an internal reference to Yeah::Desktop as platform" do
      instance.instance_variables.should include :@platform
      platform = instance.instance_variable_get(:@platform)
      platform.should be_kind_of Yeah::Desktop
    end
  end

  describe '#resolution' do
    subject { instance.resolution }

    it { should eq Yeah::Vector[320, 240] }
  end

  describe '#resolution=' do
    subject { instance.method(:resolution=) }

    it_behaves_like 'writer', Yeah::Vector[512, 384]
  end

  describe '#entities' do
    subject(:entities) { instance.entities }

    it { should eq [] }
  end

  describe '#entities=' do
    subject(:method) { instance.method(:entities=) }

    it_behaves_like 'writer', [Yeah::Entity.new(Random.rand(10))]
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
