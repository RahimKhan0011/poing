netsh advfirewall firewall set rule group="remote desktop" new enable=yes
netstat -an | find "3389"
