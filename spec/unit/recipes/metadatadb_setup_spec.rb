#
# Cookbook:: pacifica-dependencies-cookbook
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'pacifica-dependencies::metadatadb_setup' do
  before do
    stub_command("psql -c '\\l' | grep -q pacifica_metadata").and_return(true)
    stub_command("psql -c 'SELECT rolname FROM pg_roles;' | grep -q pacifica").and_return(true)
    stub_command("psql -c '\\l' | grep -q pacifica=").and_return(true)
    stub_command("psql -c 'SELECT encoding FROM pg_database;' | grep -q template0").and_return(true)
    stub_command("psql -c 'SELECT encoding FROM pg_database;' | grep -q template1").and_return(true)
    stub_command("psql -c 'SELECT encoding FROM pg_database;' | grep -q postgres").and_return(true)
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
