describe Vector, '#-' do
  it "subtracts Vector" do
    difference = subject - subject
    difference.components.each do |component|
      component.should eq 0
    end

    difference2 = difference - subject
    difference2.components.each_with_index do |component, i|
      component.should eq -subject.components[i]
    end
  end

  it "subtracts Numeric" do
    subtrahend = Random.rand(100)
    difference = subject - subtrahend

    difference.components.each_with_index do |component, i|
      component.should eq subject.components[i] - subtrahend
    end
  end
end
