include_recipe "hosts"

execute "apt-get update" do
  command "apt-get update"
end

directory "/var/cache/apt/archives" do
  action :create
end

execute "copy any packages cached from previous instances" do
  command "cp -f /vagrant/tmp/var/cache/apt/archives/*.deb /var/cache/apt/archives/"
end

package "ubuntu-desktop"

directory "/vagrant/tmp/var/cache/apt/archives" do
  action :create
  recursive true
  owner "vagrant"
end

execute "copy any packages cached for future instances" do
  command "cp -f /var/cache/apt/archives/*.deb /vagrant/tmp/var/cache/apt/archives/"
end

template "/etc/lightdm/lightdm.conf" do
  source "lightdm.conf"
  mode "0644"
end

hosts "10.0.2.2" do
  action :create
  entries ["api.jirafe.com"]
end

hosts "192.168.200.1" do
  action :create
  entries ["c.jirafe.com"]
end

hosts "192.168.200.10" do
  action :create
  entries ["spree.local", "magento.local", "prestashop.local", "xtcommerce.local"]
end



