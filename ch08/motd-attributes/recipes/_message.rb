#
# Cookbook Name:: motd-attributes
# Recipe:: message
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# A private recipe defining a text message to be displayed as part of
# the "message of the day" displayed at system login.

node.default['motd-attributes']['company'] = "the best company in the 'verse"
