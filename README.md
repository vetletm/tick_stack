## Description

Puppet code for deploying the entire TICK stack as a single module, written as part of a bachelors project.

## Dependencies
  - Puppetlabs/inifile, version > 2.0.0
  - Puppetlabs/apt, version > 5.0.0
  - Puppetlabs/stdlib, version > 2.4.0
  - Puppet/yum, version > 3.0.0

## Example
To install telegraf and influxdb on one host with default settings: 
```puppet
node default {
  include tick_stack::influxdb
  include tick_stack::telegraf
}

```

To install telegraf to use an external InfluxDB host:
```puppet
node default {
  class { 'tick_stack::telegraf':
    url         => '"http://10.10.0.1:8086"',
    database    => '"telegraf"',
    precision   => '"s"',
}
```
