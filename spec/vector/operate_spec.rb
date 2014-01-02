describe Vector, '#operate' do
  subject { V.random(20, 20, 20) + V[1, 1, 1] }
  let(:operators) { [:+, :-, :*, :/] }

  it { subject.private_methods.should include(:operate) }

  it "operates on Numeric" do
    operand = Random.rand(50) + 1
    operators.each do |operator|
      expected = V[*subject.components.map { |c| c.send(operator, operand)}]
      subject.send(:operate, operator, operand).should eq expected
    end
  end

  it "operates on Vector" do
    operand = V.random(20, 20, 20) + V[1, 1, 1]

    operators.each do |operator|
      result = subject.send(:operate, operator, operand)

      result.components.each_with_index do |component, i|
        comp1 = subject.components[i]
        comp2 = operand.components[i]
        expected = comp1.send(operator, comp2)

        component.should eq expected
      end
    end
  end
end
