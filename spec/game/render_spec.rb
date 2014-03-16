describe Game, '#render' do
  before do
    subject.space = Space.new
  end

  context "after start" do
    before { subject.start }

    it "passes space into context's render" do
      expect(subject.context).to receive(:render).with(subject.space)
      subject.send(:render)
    end
  end
end
