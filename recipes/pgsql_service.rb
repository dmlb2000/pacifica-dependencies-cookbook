#
# Cookbook:: pacifica-dependencies-cookbook
# Recipe:: pgsql_service
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'chef-sugar'
packages = if ubuntu?
             %w(postgresql postgresql-client)
           elsif rhel?
             %w(postgresql-server postgresql)
           end
service_name = 'postgresql'

package 'PostgreSQL Packages' do
  package_name packages
end

setup_command = if rhel? && (node[:platform_version].to_i == 6)
                  'service postgresql initdb'
                else
                  'postgresql-setup initdb'
                end

execute 'Setup PostgreSQL Database' do
  environment PGSETUP_INITDB_OPTIONS: '--encoding=utf8'
  command setup_command
  only_if { rhel? }
  not_if { ::File.exist?('/var/lib/pgsql/data/pg_hba.conf') }
end

file '/var/lib/pgsql/data/pg_hba.conf' do
  content <<-EOH
local all all ident
host pacifica_metadata  pacifica 127.0.0.1/32 md5
host pacifica_metadata  pacifica ::1/128 md5
EOH
  only_if { rhel? }
end

service 'PostgreSQL Service' do
  service_name service_name
  action [:enable, :start]
end
