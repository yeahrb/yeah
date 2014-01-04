describe Entity, '#render' do
  let(:instance) { described_class.new }
  subject { instance.method(:render) }

  its(:call) { should eq nil }

  it "gets #render of #visual if it exists" do
    instance.visual = Rectangle.new
    instance.visual.should receive(:render)
    instance.render
  end
end
