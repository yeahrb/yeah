describe Game do
  subject { Class.new(described_class) }

  describe '::space' do
    its(:space) { should be_nil }
  end

  describe '::space=' do
    include_examples :writer, :space=
  end
end
