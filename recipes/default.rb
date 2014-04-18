#
# Cookbook Name:: dhcp-client
# Recipe:: default
#
# Copyright 2014, Denis Baryshev <dennybaa@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package node['dhcp-client']['package'] do
  action :install
end

request_options = node['dhcp-client']['request']['default_options']
unless node['dhcp-client']['dhcp6_enabled']
  request_options -= node['dhcp-client']['request']['dhcp6_options']
end
unless node['dhcp-client']['resolv_conf_update']
  request_options -= node['dhcp-client']['request']['resolv_options']
end

node.default['dhcp-client']['request']['options'] = request_options

template "#{node['dhcp-client']['dhcpdir']}/dhclient.conf" do
  source 'dhclient.conf.erb'
  mode  00644
  owner 'root'
  group 'root'
end
