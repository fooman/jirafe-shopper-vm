execute "apt-get update" do
  command "apt-get update"
end

package "ubuntu-desktop"

template "/etc/lightdm/lightdm.conf" do
  source "lightdm.conf"
  mode "0644"
end

execute "start the gui" do
  command "service lightdm start"
end



