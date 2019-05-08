# PM2

## Introduction

PM2 Runtime is a Production Process Manager for Node.js applications with a built-in Load Balancer. It allows you to keep applications alive forever, to reload them without downtime and facilitate common Devops tasks.

[https://pm2.io/doc/en/runtime/overview/](https://pm2.io/doc/en/runtime/overview/)

## Installation

Initial installation is accomplished through execution of the following command:

```bash
npm install pm2 -g
```

Set PM2 to start at system startup:

```bash
pm2 startup
```

## Useful PM2 Commands

**List active processes**

```bash
pm2 list
```

**Display process details**

```bash
pm2 show [app]
```

**Tail application logs**

```bash
pm2 logs [app]
```

**Global monitor**

```bash
pm2 monit
```

**Restart active process**

```bash
pm2 restart [app]
```

**Kill active process**

```bash
pm2 delete [app]
```