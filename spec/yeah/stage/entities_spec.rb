describe Stage do
  let(:instance) { described_class.new }

  describe '#entities' do
    subject { instance.entities }

    it { should eq [] }
  end

  describe '#entities=' do
    subject { instance.method(:entities=) }

    it_behaves_like 'writer', [Entity.new(Random.rand(10))]

    it "assigns each item's #stage as self" do
      entities = [Entity.new, Entity.new]
      instance.entities = entities

      entities.each { |e| e.stage.should eq instance }
    end
  end
end
