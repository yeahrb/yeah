shared_examples_for :vector_magnitude do |method_name|
  it { described_class.new(3, 4).method(method_name).call.should eq 5 }
  it { described_class.new(6, 8).method(method_name).call.should eq 10 }
end
