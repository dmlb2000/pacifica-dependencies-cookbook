#
# Cookbook:: pacifica-dependencies-cookbook
# Recipe:: metadatadb_setup
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute 'Create Pacifica Database' do
  command %(psql -c "create database pacifica_metadata with encoding 'UTF8';")
  user 'postgres'
  not_if %(psql -c '\\l' | grep -q pacifica_metadata), user: 'postgres'
end

execute 'Create Pacifica Role' do
  command %(psql -c "create role pacifica with login password 'pacifica';")
  user 'postgres'
  not_if %(psql -c 'SELECT rolname FROM pg_roles;' | grep -q pacifica), user: 'postgres'
end

execute 'Grant Pacifica Permissions' do
  command %(psql -c "grant all on database pacifica_metadata to pacifica;")
  user 'postgres'
  not_if %(psql -c '\\l' | grep -q pacifica=), user: 'postgres'
end
