#
# Cookbook Name:: databag_example
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'apt-get update' do
  command 'apt-get update'
end

data_bag('packages').each do |pkg|
  install_pkg = data_bag_item('packages', pkg)
  package install_pkg['name'] do
    action :install
  end
end

group 'test' do
  action :create
end

group = 'test'

sudo group do
  group '%'+group
  nopasswd true
end
