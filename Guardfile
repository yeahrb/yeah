guard :rspec do
  watch('spec/spec_helper.rb')
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/yeah/((\w+\/)*)(.+).rb$}) { |m| "spec/#{m[2]}#{m[3]}/" }
end

