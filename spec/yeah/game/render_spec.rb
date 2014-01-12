describe Game, '#render' do
  before do
    subject.stage = Stage.new
  end

  context "after start" do
    let(:render) { subject.send(:render) }

    before { subject.start }

    it "passes stage into context's render" do
      expect { subject.context }.to_receive(:render).with(subject.stage)
      render
    end
  end
end
