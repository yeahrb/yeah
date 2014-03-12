describe Level, '#update' do
  subject { described_class.new }

  before { subject.things = (1..3).map { Thing.new } }

  it "calls #update on each thing in #things" do
    subject.things.each { |e| e.should receive(:update) }
    subject.update
  end
end
