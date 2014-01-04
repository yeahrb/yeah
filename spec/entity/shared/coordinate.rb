shared_examples_for :entity_coordinate do |method_name, dimension|
  it "is #position.#{method_name}" do
    subject.position.send("#{method_name}=", Random.rand(100))
    subject.send(method_name).should eq subject.position.send(method_name)
  end
end

shared_examples_for :entity_coordinate= do |method_name, dimension|
  it "assigns #position.#{method_name}" do
    value = Random.rand(100)
    subject.send("#{method_name}=", value)
    subject.position.send(method_name).should eq value
  end
end
