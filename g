netsh advfirewall firewall set rule group="remote desktop" new enable=yes
netstat -an | find "3389"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

Set-ItemProperty 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0; Enable-NetFirewallRule -DisplayGroup "Remote Desktop"; Get-Service termservice | Restart-Service; (Get-NetConnectionProfile).NetworkCategory="Private"


# 1. Enable RDP
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

# 2. Allow RDP through firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# 3. Set the network to Private (if it's Public)
Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private

# 4. Ensure RDP service is running
Start-Service termservice

Get-NetTCPConnection -LocalPort 3389

(Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server").fDenyTSConnections
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name fDenyTSConnections -Value 0


Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Restart-Service termservice
