# Redis

## Introduction

[Redis](http://redis.io/) is an open source, in-memory data structure store, used as a database, cache and message broker.

## Installation

Initial installation is accomplished through execution of the following commands:

```bash
sudo apt update
sudo apt install redis-server
```

Following installation, we need to update the `supervised ` setting within `/etc/redis/redis.conf`. Open that file and set it as follows:

```bash
supervised systemd
```

Then restart the Redis service:

```bash
sudo systemctl restart redis.service
```

**Source:** [How To Install and Secure Redis on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-18-04)

## System Status

Execute the following to get a report on system status:

```bash
sudo systemctl status redis
```

## Redis CLI

### Entering the CLI

Fairly simple here. From the command line:

```bash
redis-cli
```

### System Info

From within the Redis CLI:

```bash
127.0.0.1:6379> INFO
```

## Troubleshooting

### Memory allocation issues

Recently some of my Laravel applications starting throwing 500 errors. The logs revealed the following:

```bash
production.ERROR: MISCONF Redis is configured to save RDB snapshots, but is currently not able to persist on disk. Commands that may modify the data set are disabled. Please check Redis logs for details about the error.
```

In looking further into the Redis logs, I saw the following details:

```bash
# Can't save in background: fork: Cannot allocate memory
```

The amount of data that I am storing in Redis is relatively small (~30MB) so the fact that I am encountering this error on a virtual machine with 1 GB of RAM and 30 GB of disk space seems quite odd.

I found a number of articles that attempted to describe the problem and offer some solutions. I am not currently comfortable with my understanding of the issue nor the solution that I employed.

This article seemed to give the best explanation of the problem: [http://pingredis.blogspot.com/2016/09/redis-error-cant-save-in-background.html](http://pingredis.blogspot.com/2016/09/redis-error-cant-save-in-background.html). Per that article:

> Redis periodically saves its data in memory onto the disk for backup in the form of rdb file. This is helpful in recovering the data if Redis restarts or for backup purposes. Sometimes while saving the data, Redis may give the error: "Can't save in background : fork: Cannot allocate memory". This error can come if Redis has enough memory for the data, but not for saving the rdb file.

This [StackOverflow article](https://stackoverflow.com/questions/11752544/redis-bgsave-failed-because-fork-cannot-allocate-memory) talkes about the `overcommit_memory` setting which contains the kernel virtual memory accounting mode.

The solution I employed called for an addition of `vm.overcommit_memory=1` to the `/etc/sysctl.conf` file and restarting `sysctl`.

```bash
sudo sysctl -p /etc/sysctl.conf
```
