#
# Cookbook Name:: motd-attributes
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


require 'pp'


# Try to override an automatic attribute.
node.default['ipaddress'] = '1.1.1.1'
pp node.debug_value('ipaddress')

# Define "recipe-level" attributes. 
node.default['motd-attributes']['company'] = 'cjl-magistri' 
node.default['motd-attributes']['message'] = 
	"It's a wonderful day today!"


# Include other recipes (which may, in turn, define attributes).
pp node.debug_value('motd-attributes', 'company')
include_recipe 'motd-attributes::_message'
pp node.debug_value('motd-attributes', 'company')


template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end
