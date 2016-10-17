%w{apt-transport-https ca-certificates}.each do |p|
  package p do
    action :install
  end
end

apt_repository "docker" do
  uri node[:docker][:repository][:url]
  keyserver node[:docker][:repository][:keyserver] 
  key node[:docker][:repository][:key]
  distribution node[:docker][:repository][:destribution]
  components ["main"]
  action :add
end

execute "apt-get-update" do
  command "apt-get update"
  not_if "ls /usr/bin/connect"
end

apt_package 'docker-engine' do
  version node[:docker][:engine][:version]
  action :install
end

cookbook_file "/usr/bin/connect" do
  source "connect"
  mode 00755
  owner "root"
  group "root"
end
