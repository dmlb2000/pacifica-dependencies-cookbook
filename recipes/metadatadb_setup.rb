#
# Cookbook:: pacifica-dependencies-cookbook
# Recipe:: metadatadb_setup
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute 'sleep 3'
%w(
  template0
  template1
  postgres
).each do |db_name|
  execute "Update encoding #{db_name} database to UTF8" do
    command %(psql -c "UPDATE pg_database SET encoding = pg_char_to_encoding('UTF8') WHERE datname = '#{db_name}';")
    user 'postgres'
    not_if %(psql -c 'SELECT encoding FROM pg_database;' | grep -q #{db_name}), user: 'postgres'
  end
end
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
