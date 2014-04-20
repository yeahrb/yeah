shared_examples_for :color_rgb do |method_name|
  its(method_name) { should eq [0, 0, 0] }

  it "matches values for red, green and blue" do
    rgb_methods = %i[red green blue]

    rgb_methods.each do |method|
      subject.send("#{method}=", Random.rand(10))
    end

    rgb_values = rgb_methods.map { |m| subject.send(m) }

    expect(subject.send(method_name)).to eq rgb_values
  end
end
