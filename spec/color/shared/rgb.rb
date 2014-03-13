shared_examples_for :color_rgb do |method_name|
  it "matches color values for red, green and blue" do
    rgb_methods = %i[red green blue]

    rgb_methods.each do |method|
      writer = "#{method}="
      subject.send(writer, Random.rand(10))
    end

    rgb_values = rgb_methods.map { |m| subject.send(m) }

    method_result = subject.send(method_name)

    expect(method_result).to eq rgb_values
  end
end
