guard :rspec do
  watch('spec/spec_helper.rb')
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib(\/\w+)?\/(.+)\.rb$}) { |m| "spec/#{m[2]}_spec.rb" }
end

