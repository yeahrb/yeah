describe Space do
  describe '#background' do
    include_examples :reader, :background

    its(:background) { should eq Color[] }
  end

  describe '#background=' do
    include_examples :writer, :background=, Color[0.1, 0.2, 0.3]

    #include_examples :coerces_to_color, :background=
    it "coerces given value to color" do
      value = [0.2, 0.2, 0.2]
      subject.background = value

      expect(subject.background).to eq Color[value]
    end
  end
end
