# Has an accessor.
shared_examples :has_accessor do |method_name|
  let(:reader_name) { method_name }
  let(:writer_name) { "#{reader_name}=" }
  let(:reader) { subject.method(reader_name) }
  let(:writer) { subject.method(writer_name) }

  describe "##{method_name}" do # reader
    it { should respond_to reader_name }

    it do # has a default value
      if defined? default
        reader.call.should eq default
      end
    end

    it do # has a default type
      if defined? default_type
        reader.call.should be_instance_of default_type
      end
    end
  end

  describe "##{method_name}=" do # writer
    it { should respond_to writer_name }

    it do # can assign assignables
      assignables.each do |assignable|
        writer.call(assignable)

        # all assignables should match after being assigned
        reader.call.should eq assignables.first
      end
    end

    it do # coerces to type
      if defined? coerce_type
        assignables.each do |assignable|
          writer.call(assignable)

          reader.call.should be_instance_of coerce_type
        end
      end
    end
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
