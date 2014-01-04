require_relative 'safe_loop_context'

describe Game, '#start' do
  include_context :safe_loop

  it "instantiates a DesktopBackend for #context" do
    subject.start
    subject.context.should be_instance_of DesktopWindow
  end

  it "calls #context#each_tick with a block with #update and #render calls" do
    subject.should receive(:update)
    subject.should receive(:render)
    subject.start
  end
end
