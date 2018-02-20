# Certbot

## Documentation
Official Documentation: [https://certbot.eff.org/](https://certbot.eff.org/)

Additional Reference: [How To Secure Nginx with Let's Encrypt on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04) - via Digital Ocean


## Installation
The following installation commands assume you are running Nginx.
```
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx
```


## Obtaining an SSL Certificate
The following command will prompt an interactive configuration of the SSL certificate for the provided domain:

```
sudo certbot --nginx -d example.url.com
```


## Verifying Certbot Auto-Renewal
Let's Encrypt's certificates are only valid for ninety days. This is to encourage users to automate their certificate renewal process. The `certbot` package we installed takes care of this for us by running `certbot renew` twice a day via a `systemd` timer. On non-systemd distributions this functionality is provided by a script placed in `/etc/cron.d`. This task runs twice a day and will renew any certificate that's within thirty days of expiration.

To test the renewal process, you can do a dry run with certbot:

```
sudo certbot renew --dry-run
```


## Legacy Installation Process
In the early days of Let's Encrypt, installation on Ubuntu was a highly manual process. The commands below demonstrate how it used to happen. I'm keeping them around for the sake of nostalgia only.

```
# setup
name="certbot"
check="/opt/certbot/certbot-auto"

# Check if installed
if [ -e $check ]; then
    exit 0;
fi

# Install
printf "\033[1;37mInstalling $name...\033[0m\n"

# Create Directory
sudo mkdir /opt/certbot
sudo chown $USER:$USER /opt/certbot

# Install certbot utility
wget https://dl.eff.org/certbot-auto -P /opt/certbot
chmod a+x /opt/certbot/certbot-auto

# Execute Setup
/opt/certbot/certbot-auto

# Wrap it up
printf "\n\n"
```
