#
# Cookbook Name:: databag_example
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'
require 'my_server_helper'

describe 'databag_example::default' do
  platforms = default_platforms
  platforms.keys.each do |platform|
    platforms[platform]['versions'].each do |version|
      context "On #{platform} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new do |node, server|
            create_default_databag(server)
          end.converge(described_recipe)
        end

        it 'converges successfully' do
          chef_run # This should not raise an error
        end

        it 'installs apache' do
          expect(chef_run).to install_package('apache2')
        end
      end
    end
  end
end
