# lib/chef-handler-timestamp.rb
#
# Author: Simple Finance <ops@simple.com>
# Copyright 2013 Simple Finance Technology Corporation.
# Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Chef handler to add in a Last Success timestamp for use by other services

require 'rubygems'
require 'chef'
require 'chef/handler'

class ChefTimestamp < Chef::Handler
    attr_reader :config

    def initialize(config = {})
      @config = config
    end

    def report
      if run_status.success?
        ::File.open("#{Chef::Config[:file_cache_path]}/chef-success-timestamp", 'w') {|f| f.puts Time.now.to_i}
      end
    end

end

