#!/bin/sh -e

cat <<EOF > /etc/motd
Welcome to VMware ESXi $(uname -r), up'd by Vagrant $(cat /vagrant/version.txt)
EOF

esxcli software vib install -v http://download3.vmware.com/software/vmw-tools/esxui/esxui-signed.vib
