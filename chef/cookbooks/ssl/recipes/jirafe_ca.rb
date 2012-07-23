cookbook_file "/usr/local/share/ca-certificates/dev-jirafe.com.crt" do
  source "dev-jirafe.com.crt"
  mode "0644"
end

execute "update CA certificates" do
  command "update-ca-certificates -v"
end

cookbook_file "/tmp/firefox-cert8.db" do
  source "firefox-cert8.db"
  mode "0644"
end

cookbook_file "/home/vagrant/firefox.sh" do
  source "firefox.sh"
  mode "0755"
end

cookbook_file "/home/vagrant/.config/autostart/firefox" do
  only_if "test -d /home/vagrant/.config/autostart"
  source "firefox-autostart"
  mode "0644"
end

execute "start the gui" do
  command "service lightdm start || true"
end


