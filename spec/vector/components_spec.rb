require_relative 'shared/components'

describe Vector do
  include_examples :has_accessor, :components do
    let(:default) { [0, 0, 0] }
    let(:assignables) { [[9, 9, 9], V[9, 9, 9], [V[9, 9, 9]]] }
  end

  describe '#components' do
    it_behaves_like :vector_components, :components
  end

  describe '#components=' do
    it "assigns array with up to 3 numbers" do
      subject.components = [4, 5, 6]
      expect(subject.components).to eq [4, 5, 6]

      subject.components = [8, 9]
      expect(subject.components).to eq [8, 9, 0]

      subject.components = []
      expect(subject.components).to eq [0, 0, 0]
    end

    it "assigns up to 3 numeric arguments" do
      subject.components = 6, 5, 4
      expect(subject.components).to eq [6, 5, 4]

      subject.components = 8
      expect(subject.components).to eq [8, 0, 0]
    end

    it "complains when given a 4-element array" do
      assign_four = lambda { subject.components = [7, 8, 9, 10] }
      expect(assign_four).to raise_error ArgumentError, /too many elements/
    end
  end
end
