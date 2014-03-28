describe Box, '::size' do
  let(:size) { random_vector }
  let(:box_subclass) { Class.new(Box) }
  let(:box) { box_subclass.new }

  it "sets instance size" do
    box_subclass.size(size)

    expect(box.size).to eq size
  end
end
