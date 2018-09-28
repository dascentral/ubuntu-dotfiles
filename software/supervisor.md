# Supervisor

## Introduction

Supervisor is a process manager which makes managing a number of long-running programs a trivial task by providing a consistent interface through which they can be monitored and controlled.

### Resources

* [Supervisor Documentation](http://supervisord.org/)
* [How To Install and Manage Supervisor on Ubuntu and Debian VPS](https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-supervisor-on-ubuntu-and-debian-vps) - via Digital Ocean

## Installation

After logging in as the **root** user, execute these commands:

```bash
apt-get install supervisor
service supervisor restart
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
supervisorctl
```

### Reloading Following Updated Config

```bash
supervisorctl reread
supervisorctl update
```
