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


## Legacy Script Content
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
