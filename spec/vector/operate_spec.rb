describe Vector, '#operate' do
  let(:operators) { [:+, :-, :*, :/] }
  let(:random_vector) { V.random(20, 20, 20) + V[1, 1, 1] }
  subject { random_vector }

  it { subject.private_methods.should include(:operate) }

  it "operates on Numeric" do
    operand = Random.rand(50) + 1

    operators.each do |operator|
      expected_comps = subject.components.map { |c| c.send(operator, operand) }
      result = subject.send(:operate, operator, operand)

      expect(result).to eq V[expected_comps]
    end
  end

  it "operates on Vector" do
    operand = random_vector

    operators.each do |operator|
      result = subject.send(:operate, operator, operand)

      result.components.each_with_index do |component, n|
        subject_component = subject.components[n]
        operand_component = operand.components[n]
        operation_result = subject_component.send(operator, operand_component)

        expect(component).to eq operation_result
      end
    end
  end
end
