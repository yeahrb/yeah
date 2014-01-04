require_relative 'safe_loop_context'

describe Game, '#render' do
  include_context :safe_loop

  before do
    subject.stage = Stage.new
    surface = Surface.new(V[10, 10])
  end

  context "after start" do
    before { subject.start }

    it "renders stage's render" do
      subject.stage.stub(:render).and_return("the stage")
      subject.context.should receive(:render).with("the stage")
      subject.send(:render)
    end
  end
end
