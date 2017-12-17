#
# Cookbook:: pacifica-dependencies-cookbook
# Recipe:: uniqueiddb_setup
#
# Copyright:: 2017, The Authors, All Rights Reserved.
mysql_bin = '/usr/bin/mysql'
execute 'Create UniqueID Database' do
  command "#{mysql_bin} -e 'create database pacifica_uniqueid;'"
  not_if "#{mysql_bin} -e 'show databases;' | grep -q pacifica_uniqueid"
end
execute 'Grant/Create UniqueID User' do
  command "#{mysql_bin} -e 'grant all on pacifica_uniqueid.* to uniqueid@'\\''localhost'\\'' identified by '\\''uniqueid'\\'';'"
  not_if "#{mysql_bin} -e 'select User from mysql.user;' | grep uniqueid"
end
