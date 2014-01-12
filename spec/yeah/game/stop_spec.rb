require_relative 'safe_loop_context'

describe Game, '#stop' do
  include_context :safe_loop

  it "makes #screen nil" do
    subject.start
    subject.stop
    subject.context.should be_nil
  end

  it "breaks out of #update/#render loop initialized by #start" do
    subject.instance_eval "def update; stop; end"
    subject.should receive(:render).once
    subject.start
  end
end
