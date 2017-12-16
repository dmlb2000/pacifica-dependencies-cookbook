#
# Cookbook:: pacifica-dependencies-cookbook
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'pacifica-dependencies::cartdb_setup' do
  before do
    stub_command("/usr/bin/mysql -e 'show databases;' | grep -q pacifica_cart").and_return(true)
    stub_command("/usr/bin/mysql -e 'select User from mysql.user;' | grep -q cartd").and_return(true)
  end
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
