#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install the httpd package.
package "httpd"


# Configure the package to:
# - Start at system start (:start)
# - Automatically enable it on system restart (:enable)
service "httpd" do
  action [ :enable, :start ]
end
