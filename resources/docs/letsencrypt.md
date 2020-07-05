# Let's Encrypt

## Overview

[Let's Encrypt](https://letsencrypt.org/) is a nonprofit Certificate Authority providing TLS certificates to 225 million websites. 

## Certbot

[Certbot](https://certbot.eff.org/) is a free, open source software tool for automatically using Let’s Encrypt certificates on manually-administrated websites to enable HTTPS.

Installing Certbot on an Ubuntu 20.04 server requires the following commands:

```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install -y certbot python3-certbot-nginx
```

See Certbot's [official instructions](https://certbot.eff.org/lets-encrypt/ubuntufocal-nginx) for more details.

## Obtaining a Certificate

Certbot provides a variety of ways to obtain SSL certificates through  plugins. The Nginx plugin will take care of reconfiguring Nginx and reloading the config whenever necessary. To use this plugin, type the following:

```bash
sudo certbot --nginx -d domain.com -d www.domain.com
```

## Migrating Certificates

Below are my cliff notes from the following article: [5 Simple Steps to Migrate Let's Encrypt Certificates (certbot) to a New Server](https://ivanderevianko.com/2019/03/migrate-letsencrypt-certificates-certbot-to-new-server)

### Transfer SSL Certificates

We'll want to first archive the existing SSL certificates and transfer them to the new server.

Generate an archive of the existing configuration, replacing `[domain]` with your domain name:

```bash
sudo tar -chvzf certs.tar.gz /etc/letsencrypt/archive/[domain] /etc/letsencrypt/renewal/[domain].conf
```

Then copy the archive to the new web server:

```bash
scp certs.tar.gz [user]@[ip]:~/
```

### Extract SSL Certifications

Login to the new server, move the archive to the root, `su - root`, and then extract the files:

```bash
mv ~/certs.tar.gz /
cd /
su - root
sudo tar -xvf certs.tar.gz
```

### Create the "live" Symlinks

We have extracted the files to the proper archive location but we need to symlink the latest version into the `live` folder. You will need to inspect the `archive` folder to determine the most recent certificate.

You'll first wanted to create the live folder and the matching domain sub-folder:

```bash
mkdir -p /etc/letsencrypt/live/[domain]
```

Next, create the symlinks. Replace `[domain]` with your domain name and `[X]` with the highest number of the available certificates.

```bash
sudo ln -s /etc/letsencrypt/archive/[domain]/cert[X].pem /etc/letsencrypt/live/[domain]/cert.pem
sudo ln -s /etc/letsencrypt/archive/[domain]/chain[X].pem /etc/letsencrypt/live/[domain]/chain.pem
sudo ln -s /etc/letsencrypt/archive/[domain]/fullchain[X].pem /etc/letsencrypt/live/[domain]/fullchain.pem
sudo ln -s /etc/letsencrypt/archive/[domain]/privkey[X].pem /etc/letsencrypt/live/[domain]/privkey.pem
```

### Update DNS

At this point, you can update your DNS records to point the domain name to the new server. Make sure you have migrated the necessary web server configurations.

### Test Certificate Renewal

Once DNS changes have propagated, make sure the renewal will occur as expected:

```bash
sudo letsencrypt renew --dry-run
```

### Cleanup the Old Server

Be sure to remove the certificates and renewal config from the old server:

```bash
rm /etc/letsencrypt/renewal/[domain].conf
rm -rf /etc/letsencrypt/live/[domain].com
rm -rf /etc/letsencrypt/archive/[domain].com
```

## SSL Renewal

Add the following to the crontab of the `root` user:

```bash
#------------------------------------------------------------------------
# Let's Encrypt SSL Renewal
#------------------------------------------------------------------------
30 2,14 * * 1 certbot renew --pre-hook "service nginx stop" --post-hook "service nginx start" >> /var/log/letsencrypt/renew.log
```

## Resources

* **Article:** May 2020 — [How To Secure Nginx with Let's Encrypt on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04) - via Digital Ocean

