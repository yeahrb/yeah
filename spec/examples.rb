shared_examples :writer do |writer_name, value|
  value ||= Object.new
  instance_var_name = "@#{writer_name[0..-2]}"

  it "sets a[n] #{value.class} as #{instance_var_name}" do
    subject.send(writer_name, value)

    instance_var = subject.instance_variable_get(instance_var_name)
    expect(instance_var).to eq value
  end
end

shared_examples :reader do |reader_name|
  instance_var_name = "@#{reader_name}"

  it "is the value of #{instance_var_name}" do
    value = Object.new

    subject.instance_variable_set(instance_var_name, value)

    instance_var = subject.instance_variable_get(instance_var_name)
    expect(instance_var).to eq value
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
