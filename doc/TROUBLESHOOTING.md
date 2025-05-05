# Troubleshooting

## At leat one IP address is required to run AdGuard Home

### On install

That means that your server doesn't have any private IPs (it's usually the case with rented VPS), so you have to enable the `Bind to public IP addresses?` setting.

### On upgrade

It's an issue because the way the package handles the AGH configuration has changed.  
To fix this, you have to run the command `yunohost app setting adguardhome expose_port_53 -v true` to activate public IP binding and unlock your situation, then re-run the upgrade process. Sorry about that!
