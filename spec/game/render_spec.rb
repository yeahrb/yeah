describe Game, '#render' do
  before do
    subject.area = Area.new
  end

  context "after start" do
    before { subject.start }

    it "passes area into context's render" do
      expect(subject.context).to receive(:render).with(subject.area)
      subject.send(:render)
    end
  end
end
