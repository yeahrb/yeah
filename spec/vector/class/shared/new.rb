shared_examples_for :vector_class_new do |subject_name|
  subject { described_class.method(subject_name) }

  it { subject.call.should be_instance_of described_class }
  it { subject.call.components.should eq [0, 0, 0] }
  it { subject.call(4, 5, 6).components.should eq [4, 5, 6] }
  it { subject.call(8, 9).components.should eq [8, 9, 0] }
  it { subject.call(7).components.should eq [7, 0, 0] }
  it { subject.call([9, 5]).components.should eq [9, 5, 0] }
  it { subject.call(V[2, 3, 4]).components.should eq [2, 3, 4] }
end
