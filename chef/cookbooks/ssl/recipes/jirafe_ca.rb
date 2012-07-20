cookbook_file "/usr/local/share/ca-certificates/dev-jirafe.com.crt" do
  source "dev-jirafe.com.crt"
  mode "0644"
end

execute "update CA certificates" do
  command "update-ca-certificates -v"
end

execute "create firefox profile" do
  command "export DISPLAY=:0; firefox -CreateProfile jirafe"
  cwd "/home/vagrant"
  user "vagrant"
end

cookbook_file "/tmp/firefox-cert8.db" do
  source "firefox-cert8.db"
  mode "0644"
end

execute "install certificate database into firefox profile" do
  command "cp -f /tmp/firefox-cert8.db /home/vagrant/.mozilla/firefox/*.jirafe/cert8.db"
  cwd "/home/vagrant"
  user "vagrant"
end
