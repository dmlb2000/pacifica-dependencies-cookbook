#
# Cookbook:: pacifica-dependencies-cookbook
# Recipe:: ingestdb_setup
#
# Copyright:: 2017, The Authors, All Rights Reserved.
mysql_bin = '/usr/bin/mysql'
execute 'Create Ingest Database' do
  command "#{mysql_bin} -e 'create database pacifica_ingest;'"
  not_if "#{mysql_bin} -e 'show databases;' | grep -q pacifica_ingest"
end
execute 'Grant/Create Ingest User' do
  command "#{mysql_bin} -e 'grant all on pacifica_ingest.* to ingest@'\\''localhost'\\'' identified by '\\''ingest'\\'';'"
  not_if "#{mysql_bin} -e 'select User from mysql.user;' | grep ingest"
end
