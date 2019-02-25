## Description

Puppet code for deploying the entire TICK stack as a single module, written as part of a bachelors project.

## Dependencies
  - Puppetlabs/inifile, version > 2.0.0
  - Puppetlabs/apt, version > 5.0.0
  - Puppetlabs/stdlib, version > 2.4.0
  - Puppet/yum, version > 3.0.0

## Example
To install Telegraf and InfluxDB on one host with default settings: 
```puppet
node default {
  include tick_stack::influxdb
  include tick_stack::telegraf
}

```

To install Telegraf to use an external InfluxDB host:
```puppet
node default {
  class { 'tick_stack::telegraf':
    url         => '"http://10.10.0.1:8086"',
    database    => '"telegraf"',
    precision   => '"s"',
}
```

To remove Telegraf and InfluxDB
```puppet
node default {
  class { 'tick_stack::telegraf':
    ensure => absent,
    service => stopped,
  }
  class { 'tick_stack::influxdb':
    ensure => absent,
    service => stopped,
  }
}
```
**note**: This won't remove the config files or any other files created by the packages, this will only make sure the packages installed with your package manager are removed and that the systemd services are stopped.
