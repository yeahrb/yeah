describe Vector, '#/' do
  let(:components) { [1, 3, 5].shuffle }
  subject { described_class.new(components) }

  it "divides by Vector" do
    quotient = subject / subject
    quotient.components.each do |component|
      component.should eq 1
    end

    quotient2 = subject / quotient
    quotient2.components.each_with_index do |component, i|
      component.should eq subject.components[i]
    end
  end

  it "divides by Numeric" do
    divisor = Random.rand(100) + 1
    quotient = subject / divisor

    quotient.components.each_with_index do |component, i|
      component.should eq subject.components[i] / divisor
    end
  end
end
