require 'yeah'
include Yeah

shared_examples 'writer' do |value|
  it "assigns its reader" do
    writer = subject
    reader_name = writer.name[0..-2].to_sym
    reader = writer.receiver.method(reader_name)

    writer.call(value)
    reader.call.should eq value
  end
end
