describe Game do
  include_examples :has_accessor, :data do
    let(:default) { Hash.new }
    let(:assignables) { [{ stuff: "lorem ipsum"}] }
  end
end
