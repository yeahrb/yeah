describe Game, '#render' do
  before do
    subject.level = Level.new
  end

  context "after start" do
    before { subject.start }

    it "passes level into context's render" do
      expect(subject.context).to receive(:render).with(subject.level)
      subject.send(:render)
    end
  end
end
