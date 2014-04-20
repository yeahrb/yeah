describe Game do
  describe '#data' do
    include_examples :reader, :data

    its(:data) { should eq Hash.new }
  end

  describe '#data=' do
    include_examples :writer, :data=
  end
end
