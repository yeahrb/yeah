describe DesktopWindow, '#screen' do
  subject { described_class.new.screen }

  it { should be_instance_of Rubygame::Screen }
  its(:size) { should eq [320, 180] }
end
