shared_examples_for :vector_component do |method_name, n|
  let(:components) { [1, 3, 5].shuffle }
  subject { described_class.new(*components).send(method_name) }

  it { should eq components[n] }
end
