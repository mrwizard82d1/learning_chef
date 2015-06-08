#
# Cookbook Name:: motd-attributes
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


# Define an "recipe-level" attribute.
node.default['motd-attributes']['message'] = "It's a wonderful day today!"


template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end
