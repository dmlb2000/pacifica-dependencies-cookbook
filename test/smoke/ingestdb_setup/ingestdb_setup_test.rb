# # encoding: utf-8

# Inspec test for recipe pacifica-dependencies-cookbook::ingestdb_setup

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
mysql_bin = '/usr/bin/mysql'

describe command("#{mysql_bin} -e 'show databases;' | grep -q pacifica_ingest") do
  its(:exit_status) { should eq 0 }
end

describe command("#{mysql_bin} -e 'select User from mysql.user;' | grep ingest") do
  its(:exit_status) { should eq 0 }
end
