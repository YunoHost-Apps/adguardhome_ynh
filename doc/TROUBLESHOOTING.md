# Troubleshooting

## At leat one IP adress is required to run AdGuard Home

If you're using a VPS that haven't any private IPs, you need to run the command `yunohost app setting adguardhome expose_port_53 -v true` to activate public IP binding and unlock your situation, then re-run the upgrade process. Sorry about that!
