#
# Cookbook:: pacifica-dependencies-cookbook
# Recipe:: rabbitmq
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'rabbitmq'
include_recipe 'rabbitmq::virtualhost_management'
include_recipe 'rabbitmq::user_management'
