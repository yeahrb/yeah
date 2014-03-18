describe Thing, '#setup' do
  subject { described_class.new.method(:setup) }

  its(:call) { should eq nil }

  it "is called at the end of initialization" do
    position = random_vector

    class Subthing < Thing
      def setup
        @position_at_setup = position
      end
    end

    instance = Subthing.new(position: position)
    position_at_setup = instance.instance_variable_get(:@position_at_setup)

    expect(position_at_setup).to eq position
  end
end
