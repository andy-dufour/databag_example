#
# Cookbook Name:: databag_example
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'databag_example::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    before do
      stub_data_bag('packages').and_return(['apache2'])
      stub_data_bag_item('packages', 'apache2').and_return({name: 'apache2'})
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'installs apache' do
      expect(chef_run).to install_package('apache2')
    end
  end
end
