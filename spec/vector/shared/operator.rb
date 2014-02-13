shared_examples_for :vector_operator do |operator|
  it "calls #operate with operator and operand" do
    expect(subject).to receive(:operate).with(operator, 5)
    subject.send(operator, 5)
  end
end
