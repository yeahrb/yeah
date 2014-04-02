require_relative 'shared/coordinate'

describe Thing do
  include_examples :has_accessor, :y do
    let(:default) { subject.position.y }
    let(:assignables) { [20] }
  end
end
