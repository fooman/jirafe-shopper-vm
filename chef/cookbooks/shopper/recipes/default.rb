include_recipe "hosts"

execute "apt-get update" do
  command "apt-get update"
end

package "ubuntu-desktop"

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

execute "start the gui" do
  command "service lightdm start"
end



