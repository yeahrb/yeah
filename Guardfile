guard :rspec, cli: "--color" do
  watch('spec/spec_helper.rb')
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib(\/yeah)?\/(.+)\.rb$}) { |m| "spec/#{m[2]}_spec.rb" }
end

