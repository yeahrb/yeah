describe Vector, '#*' do
  it "multiplies by Vector" do
    product = subject * subject
    product.components.each_with_index do |component, i|
      component.should eq subject.components[i] ** 2
    end
  end

  it "multiplies by Numeric" do
    multiple = Random.rand(100)
    product = subject * multiple

    product.components.each_with_index do |component, i|
      component.should eq subject.components[i] * multiple
    end
  end
end
