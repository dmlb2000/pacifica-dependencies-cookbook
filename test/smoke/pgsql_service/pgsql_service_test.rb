# # encoding: utf-8

# Inspec test for recipe pacifica-dependencies-cookbook::pgsql_service

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe command('sleep 5') do
  its(:exit_status) { should eq 0 }
end
describe port(5432) do
  it { should be_listening }
end
