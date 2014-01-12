describe DesktopWindow, '#each_tick' do
  let(:instance) { described_class.new }

  it { expect {instance.each_tick}.to raise_error LocalJumpError }

  it "repeatedly calls passed block" do
    call_count = 0

    instance.each_tick do
      call_count += 1
      break if call_count == 5
    end

    call_count.should eq 5
  end

  it "calls Rubygame::Clock#tick per call" do
    call_count = 0
    tick_call_count = 0
    allow(instance.instance_variable_get(:@clock)).to receive(:tick) do
      tick_call_count += 1
    end

    instance.each_tick do
      break if tick_call_count == 5
      call_count += 1
    end

    call_count.should eq 5
    tick_call_count.should eq 5
  end
end
