# # encoding: utf-8

# Inspec test for recipe pacifica-dependencies-cookbook::metadatadb_setup

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command(%(su - postgres -c "psql -c '\\l' | grep -q pacifica_metadata")) do
  its(:exit_status) { should eq 0 }
end

describe command(%(su - postgres -c "psql -c 'SELECT rolname FROM pg_roles;' | grep -q pacifica")) do
  its(:exit_status) { should eq 0 }
end

describe command(%(su - postgres -c "psql -c '\\l' | grep -q pacifica=")) do
  its(:exit_status) { should eq 0 }
end
