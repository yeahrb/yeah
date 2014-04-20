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

shared_examples :coerces_to_vector do |writer_name|
  it "coerces given value to a Vector" do
    instance_var_name = "@#{writer_name[0..-2]}"
    value = [1, 2, 3]

    subject.send(writer_name, value)

    instance_var = subject.instance_variable_get(instance_var_name)
    expect(instance_var).to eq Vector[value]
  end
end

shared_examples :coerces_to_color do |writer_name|
  it "coerces given value to a Color" do
    instance_var_name = "@#{writer_name[0..-2]}"
    value = [0.1, 0.2, 0.3]

    subject.send(writer_name, value)

    instance_var = subject.instance_variable_get(instance_var_name)
    expect(instance_var).to eq Color[value]
  end
end
