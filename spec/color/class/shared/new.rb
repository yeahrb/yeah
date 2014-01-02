shared_examples_for :color_class_new do |method_name|
  subject { described_class.method(method_name) }

  it { subject.call.should be_instance_of described_class }
  it { subject.call.rgba_bytes.should eq [0, 0, 0, 255] }
  it { subject.call(42).rgba_bytes.should eq [42, 0, 0, 255] }
  it { subject.call(9, 8, 7).rgba_bytes.should eq [9, 8, 7, 255] }
  it { subject.call(10, 20, 30, 40).rgba_bytes.should eq [10, 20, 30, 40] }
  it { subject.call(55, 25, 55, 25).rgba_bytes.should eq [55, 25, 55, 25] }
end
