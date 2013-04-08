require 'spec_helper'

describe NotArt do
  it "is a Module" do
    NotArt.must_be_instance_of Module
  end

  describe '::Version' do
    it "is a String" do
      NotArt::Version.must_be_instance_of String
    end
  end
end
