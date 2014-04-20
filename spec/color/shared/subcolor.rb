shared_examples :color_subcolor do |method_name|
  describe "##{method_name}" do
    its(method_name) { should eq 0 }
  end

  describe "##{method_name}=" do
    include_examples :writer, "#{method_name}="
  end
end
