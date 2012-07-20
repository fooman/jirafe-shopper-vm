cookbook_file "/usr/local/share/ca-certificates/dev-jirafe.com.crt" do
  source "dev-jirafe.com.crt"
  mode "0600"
end

execute "update CA certificates" do
  command "update-ca-certificates -v"
end
