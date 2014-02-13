describe Game, '#render' do
  before do
    subject.stage = Stage.new
  end

  context "after start" do
    before { subject.start }

    it "passes stage into context's render" do
      expect(subject.context).to receive(:render).with(subject.stage)
      subject.send(:render)
    end
  end
end
