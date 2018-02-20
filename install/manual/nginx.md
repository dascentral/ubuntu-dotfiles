# Nginx

## Documentation
Unsure of where I pulled this from.


## Installation
I have a particular directory structure that I like to maintain. These instructions assume you want to match my style.

```
sudo apt-get install -y nginx
sudo chown -R $USER:$USER /usr/share/nginx/html
sudo chown -R $USER:$USER /etc/nginx/sites-available
sudo chown -R $USER:$USER /etc/nginx/sites-enabled
mkdir -p /usr/share/nginx/html/server
mkdir -p /usr/share/nginx/html/dev
mkdir -p /usr/share/nginx/html/stage
mkdir -p /usr/share/nginx/html/prod
mv /usr/share/nginx/html/50x.html /usr/share/nginx/html/server
mv /usr/share/nginx/html/index.html /usr/share/nginx/html/server
sudo sed -i 's/root \/usr\/share\/nginx\/html\;/root \/usr\/share\/nginx\/html\/server\;/g' /etc/nginx/sites-available/default
sudo service nginx reload
```