describe Game, '#stop' do
  it "breaks out of #update/#render loop initialized by #start" do
    subject.instance_eval "def update; stop; end"
    subject.should receive(:render).once
    subject.start
  end
end
