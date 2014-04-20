describe Box do
  describe '#color' do
    include_examples :reader, :color

    its(:color) { should eq Color[] }
  end

  describe '#color=' do
    include_examples :writer, :color=, Color[0.5, 0.5, 0.5]
    include_examples :coerces_to_color, :color=
  end
end
