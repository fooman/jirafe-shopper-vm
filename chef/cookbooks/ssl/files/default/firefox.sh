#!/bin/sh
if [ ! -d /home/vagrant/.mozilla/firefox/*.jirafe ]; then
  firefox -CreateProfile jirafe
  cp -f /tmp/firefox-cert8.db /home/vagrant/.mozilla/firefox/*.jirafe/cert8.db
  sleep 3
fi
exec firefox $*
