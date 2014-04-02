require_relative 'shared/coordinate'

describe Thing do
  include_examples :has_accessor, :depth do
    let(:default) { subject.size.z }
    let(:assignables) { [10] }
  end
end
