describe Stage, '#update' do
  subject { described_class.new }

  before { subject.entities = (1..3).map { Entity.new } }

  it "calls #update on each entity in #entities" do
    subject.entities.each { |e| e.should receive(:update) }
    subject.update
  end
end
