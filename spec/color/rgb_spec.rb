require_relative 'shared/rgb'

describe Color do
  describe '#rgb' do
    it_behaves_like :color_rgb, :rgb
  end

  describe '#rgb=' do
    it "sets #red, #green and #blue" do
      value = random_vector
      subject.rgb = value

      %i[red green blue].each_with_index do |color, i|
        expect(subject.send(color)).to eq subject.rgb[i]
      end
    end
  end
end
