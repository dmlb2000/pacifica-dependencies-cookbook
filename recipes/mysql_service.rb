#
# Cookbook:: pacifica-dependencies-cookbook
# Recipe:: mysql_service
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'chef-sugar'
build_essential 'default'
packages = if rhel?
             if node['platform_version'].to_i == 6
               %w(mysql-server mysql mysql-devel)
             elsif node['platform_version'].to_i == 7
               %w(mariadb-server mariadb mariadb-devel)
             end
           elsif ubuntu?
             %w(mysql-client mysql-server libmysqlclient-dev)
           end
service_name = if rhel?
                 if node['platform_version'].to_i == 6
                   'mysqld'
                 elsif node['platform_version'].to_i == 7
                   'mariadb'
                 end
               elsif ubuntu?
                 'mysql'
               end
package 'CentOS SCL Packages' do
  package_name %w(centos-release-scl centos-release-scl-rh)
  only_if { rhel? }
end
package 'MySQL Packages' do
  package_name packages
end
service 'MySQL Service' do
  service_name service_name
  action [:start, :enable]
end
