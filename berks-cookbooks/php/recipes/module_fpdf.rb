#
# Author::  Joshua Timberman (<joshua@chef.io>)
# Author::  Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: php
# Recipe:: module_fpdf
#
# Copyright:: 2009-2017, Chef Software, Inc.
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
when 'rhel', 'fedora', 'amazon'
  pearhub_chan = php_pear_channel 'pearhub.org' do
    binary node['php']['pear']
    action :discover
  end
  php_pear 'FPDF' do
    channel pearhub_chan.channel_name
    binary node['php']['pear']
    action :install
  end
when 'debian'
  package 'php-fpdf' do
    action :install
  end
end
