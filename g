netsh advfirewall firewall set rule group="remote desktop" new enable=yes
netstat -an | find "3389"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
