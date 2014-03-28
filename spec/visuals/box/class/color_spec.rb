describe Box, '::color' do
  let(:color) { Color[0.1, 0.2, 0.3] }
  let(:box_subclass) { Class.new(Box) }
  let(:box) { box_subclass.new }

  it "sets instance color" do
    box_subclass.color(color)

    expect(box.color).to eq color
  end
end
