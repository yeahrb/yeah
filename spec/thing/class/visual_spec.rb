describe Thing, '::visual' do
  let(:visual) { NullVisual.new }
  let(:thing_subclass) { Class.new(Thing) }
  let(:thing) { thing_subclass.new }

  it "sets instance visual" do
    thing_subclass.visual(visual)

    expect(thing.visual).to eq visual
  end
end
