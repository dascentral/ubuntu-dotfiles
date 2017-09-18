# Uninstalling PHP 7.0

## PHP 7.0
The following command will remove PHP 7.0 and its dependencies:
```
sudo apt-get remove --auto-remove php7.0
```

The following command will also purge config/data related to PHP 7.0:
```
sudo apt-get purge --auto-remove php7.0
```

## PHP 7.0 Packages
You likely installed a number of packages along with PHP 7.0 proper.
Those can be removed via the following:

```
sudo apt-get purge --auto-remove php7.0-*
```
