describe Game do
  describe '#data' do
    its(:data) { should eq Hash.new }
  end

  describe '#data=' do
    include_examples :writer, :data=
  end
end
