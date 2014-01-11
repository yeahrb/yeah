require_relative 'safe_loop_context'

describe Game, '#render' do
  include_context :safe_loop

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
