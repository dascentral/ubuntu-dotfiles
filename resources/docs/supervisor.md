# Supervisor

## Introduction

[Supervisor](http://supervisord.org/) is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems. It is meant to be used to control processes related to a project or a customer, and is meant to start like any other program at boot time.

## Installation

Installation is fairly straightforward:

```bash
sudo apt-get install supervisor
sudo service supervisor restart
```

## Useful Information

All commands below should be run as the **root** user.

### Configuration

Configuration files live here:

```bash
/etc/supervisor/conf.d
```

### Viewing Running Programs

```bash
sudo supervisorctl
```

### Reloading the Configuration

After updates to any supervisor configuration files, the system should be reloaded.

```bash
sudo supervisorctl reread
sudo supervisorctl update
```

## Resources

* [Supervisor Documentation](http://supervisord.org/)
* **Laravel:** [Deploying Horizon](https://laravel.com/docs/master/horizon#deploying-horizon)
* **Article:** July 2013 — [How To Install and Manage Supervisor on Ubuntu and Debian VPS](https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-supervisor-on-ubuntu-and-debian-vps) - via Digital Ocean

