# # encoding: utf-8

# Inspec test for recipe pacifica-dependencies-cookbook::elasticsearch

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe command('sleep 30') do
  its(:exit_status) { should eq 0 }
end
describe port(9200) do
  it { should be_listening }
end
