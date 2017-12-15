# # encoding: utf-8

# Inspec test for recipe pacifica-dependencies-cookbook::mysql_service

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
puts os[:family]
mysql_socket = if %w(debian ubuntu).include?(os[:family])
                 '/var/run/mysqld/mysqld.sock'
               elsif os[:family].eql?('redhat')
                 '/var/lib/mysql/mysql.sock'
               else
                 '/some/file/not/found'
               end
describe file(mysql_socket) do
  it { should be_socket }
end
