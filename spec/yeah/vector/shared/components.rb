shared_examples_for :vector_components do |method_name|
  subject { described_class.new.send(method_name) }

  it { should be_instance_of Array }
  it { should have(3).elements }
  it { subject.each { |n| n.should be_kind_of Numeric } }
end
