#
# Cookbook:: pacifica-dependencies-cookbook
# Recipe:: cartdb_setup
#
# Copyright:: 2017, The Authors, All Rights Reserved.
mysql_bin = '/usr/bin/mysql'
execute 'Create Cart Database' do
  command "#{mysql_bin} -e 'create database pacifica_cart;'"
  not_if "#{mysql_bin} -e 'show databases;' | grep -q pacifica_cart"
end
execute 'Grant/Create Cart User' do
  command "#{mysql_bin} -e 'grant all on pacifica_cart.* to cartd@'\\''localhost'\\'' identified by '\\''cartd'\\'';'"
  not_if "#{mysql_bin} -e 'select User from mysql.user;' | grep -q cartd"
end
