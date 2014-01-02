describe Vector, '#+' do
  it "adds Vector" do
    sum = subject + subject
    sum.components.each_with_index do |component, i|
      component.should eq subject.components[i] * 2
    end
  end

  it "adds Numeric" do
    addend = Random.rand(100)
    sum = subject + addend

    sum.components.each_with_index do |component, i|
      component.should eq subject.components[i] + addend
    end
  end
end
