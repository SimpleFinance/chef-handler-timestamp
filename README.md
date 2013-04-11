# Chef-handler-timestamp
A Chef handler to add a timestamp file in Unix time at the end of a successful
Chef run. We use this to monitor how long its been since a node converged.

# Usage
Either just pull the handler file into a files directory of one of your
cookbooks, or download as a Rubygem and source it that way.

```ruby
# Option 1
cookbook_file "#{node[:chef_handler][:handler_path]}/chef-handler-timestamp.rb" do
  source 'chef-handler-timestamp.rb'
  mode 00600
end

chef_handler 'ChefTimestamp' do
  source "#{node[:chef_handler][:handler_path]}/chef-handler-timestamp.rb"
  action :enable
end

# Option 2
chef_gem 'chef-handler-timestamp' do
  action :install
end

chef_handler 'ChefTimestamp' do
  source ::File.join(Gem.all_load_paths.grep(/chef-handler-timestamp/).first,
                     'chef-handler-timestamp.rb')
  action :enable
end
```

# Author
Ops at Simple <ops@simple.com>

# License
Apache License, Version 2.0

