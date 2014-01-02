require_relative 'shared/components'

describe Vector do
  describe '#components' do
    it_behaves_like :vector_components, :components
  end

  describe '#components=' do
    it "assigns array with up to 3 numerics" do
      subject.components = [4, 5, 6]
      subject.components.should eq [4, 5, 6]

      subject.components = [8, 9]
      subject.components.should eq [8, 9, 0]

      subject.components = []
      subject.components.should eq [0, 0, 0]
    end

    it "assigns Vector" do
      subject.components = V[9, 9, 9]
      subject.components.should eq [9, 9, 9]
    end

    it "assigns up to 3 numeric arguments" do
      subject.components = 6, 5, 4
      subject.components.should eq [6, 5, 4]

      subject.components = 8
      subject.components.should eq [8, 0, 0]
    end

    it "assigns an array containing a Vector" do
      subject.components = [V[8, 7, 8]]
      subject.components.should eq [8, 7, 8]
    end

    it "complains when given a 4-element array" do
      expect { subject.components = [7, 8, 9, 10] }.
        to raise_error ArgumentError, /too many elements/
    end
  end
end
