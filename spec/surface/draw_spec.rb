describe Surface, '#draw' do
  let(:color) { Color[0, Random.rand(255), Random.rand(255), 255] }
  let(:vector) { V.random(48, 48) + V[2, 2] }
  subject { described_class.new(vector) }

  it { expect {subject.draw}.to raise_error ArgumentError }

  it "draws surface at position" do
    surface = Surface.new(V[1, 1])
    surface.fill(color)
    surface2 = Surface.new(V[10, 10])
    surface2.draw(surface, V[1, 1])

    surface2.color_at(V[0, 0]).should eq Color[0, 0, 0, 0]
    surface2.color_at(V[1, 1]).should eq color
    surface2.color_at(V[2, 2]).should eq Color[0, 0, 0, 0]
  end

  it "draws surface at (0, 0) by default" do
    surface = Surface.new(V[1, 1])
    surface.fill(color)
    surface2 = Surface.new(V[10, 10])
    surface2.draw(surface)

    surface2.color_at(V[0, 0]).should eq color
    surface2.color_at(V[1, 1]).should eq Color[0, 0, 0, 0]
  end

  it "draws a rectangular area" do
    surface = Surface.new(V[3, 3])
    surface.fill(color)
    surface2 = Surface.new(V[5, 5])
    surface2.draw(surface, V[1, 1])

    surface2.color_at(V[1, 1]).should eq color
    surface2.color_at(V[1, 3]).should eq color
    surface2.color_at(V[3, 1]).should eq color
    surface2.color_at(V[3, 3]).should eq color
    surface2.color_at(V[0, 3]).should eq Color[0, 0, 0, 0]
    surface2.color_at(V[3, 0]).should eq Color[0, 0, 0, 0]
    surface2.color_at(V[4, 3]).should eq Color[0, 0, 0, 0]
    surface2.color_at(V[3, 4]).should eq Color[0, 0, 0, 0]
  end
end
