require 'yeah'
require 'yeah/utility'
include Yeah

shared_examples :writer do |value|
  it "assigns its reader" do
    writer = subject
    reader_name = writer.name[0..-2].to_sym
    reader = writer.receiver.method(reader_name)

    writer.call(value)
    reader.call.should eq value
  end
end

shared_examples :coerces_to_vector do |value|
  it "coerces to vector" do
    writer =  subject
    reader_name = writer.name[0..-2].to_sym
    reader = writer.receiver.method(reader_name)

    writer.call(value)
    reader.call.should be_instance_of Vector
  end
end

def random_vector(component_max = 10)
  components = 3.times.collect { Random.rand(component_max) + 1 }
  V[components]
end
