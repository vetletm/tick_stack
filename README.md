## Description

Puppet code for deploying the entire TICK stack as a single module, written as part of a bachelors project.

## Dependencies
  - Puppetlabs/inifile, version > 2.0.0
  - Puppetlabs/apt, version > 5.0.0
  - Puppetlabs/stdlib, version > 2.4.0
  - Puppet/yum, version > 3.0.0

## Example
in site.pp
```puppet
node default {
  include tick_stack::repo
  include tick_stack::influxdb

  class { 'tick_stack::telegraf':
    influxdb_url        => '"http://127.0.0.1:8086"',
    influxdb_database   => '"telegraf"',
    influxdb_precision  => '"s"',
  }
}

```
