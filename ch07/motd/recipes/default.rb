#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

cookbook_file "/etc/motd" do
  source "motd"
  mode "0644"
end
