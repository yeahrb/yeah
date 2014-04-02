require_relative 'shared/coordinate'

describe Thing do
  include_examples :has_accessor, :z do
    let(:default) { subject.position.z }
    let(:assignables) { [20] }
  end
end
