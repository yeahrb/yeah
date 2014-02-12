shared_examples_for :color_class_new do |method_name|
  subject { described_class.method(method_name) }

  it { subject.call.should be_instance_of described_class }
  it { subject.call(1, 0, 1).rgb.should eq [1, 0, 1] }
  it { subject.call(0, 0.5, 1, 0.5).rgb.should eq [0, 0.5, 1] }
  it { subject.call( described_class.new ).rgb.should eq [0, 0, 0] }
end
