#
# Cookbook Name:: motd-attributes
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


# Try to override an automatic attribute.
node.default['ipaddress'] = '1.1.1.1'

# Define "recipe-level" attributes.
node.default['motd-attributes']['company'] = 'cjl-magistri'
node.default['motd-attributes']['message'] = "It's a wonderful day today!"


# Include other recipes (which may, in turn, define attributes).
include_recipe 'motd-attributes::_message'


template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end
