# # encoding: utf-8

# Inspec test for recipe pacifica-dependencies-cookbook::cartdb_setup

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# The cart database should exist
describe command('/usr/bin/mysql -e \'show databases;\' | grep -q pacifica_cart') do
  its(:exit_status) { should eq 0 }
end

describe command('/usr/bin/mysql -e \'select User from mysql.user;\' | grep -q cartd') do
  its(:exit_status) { should eq 0 }
end
