#
# Cookbook Name:: apache2
# Recipe:: python
#
# Copyright 2008-2009, Opscode, Inc.
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

case node['platform_family']
when "debian"

  package "libapache2-mod-python"

when "rhel", "fedora"

  package "mod_python" do
    notifies :run, "execute[generate-module-list]", :immediately
  end
end

file "#{node['apache']['dir']}/conf.d/python.conf" do
  content ""
end

apache_module "python"
