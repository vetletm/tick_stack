## Description

Puppet code for deploying the entire TICK stack as a single module, written as part of a bachelors project.

## Dependencies
  - Puppetlabs/inifile, version > 2.0.0
  - Puppetlabs/apt, version > 5.0.0
  - Puppetlabs/stdlib, version > 2.4.0

## Example
Install Telegraf and InfluxDB on one host with default settings:
```puppet
node default {
  include tick_stack::influxdb
  include tick_stack::telegraf
}

```

Install Telegraf to use an external InfluxDB host:
```puppet
node default {
  class { 'tick_stack::telegraf':
    outputs => {
      'outputs.influxdb' => {
        'urls'      => [ 'http://127.0.0.1:8086' ],
        'database'  => '"telegraf"',
        'precision' => '"s"',
      }
    }
}
```

Use some inputs in Telegraf:
```puppet
node default {
  class { 'tick_stack::telegraf':
    inputs => {
      'inputs.cpu' => {
        'percpu'    => true,
        'totalcpu'  => true,
      },
      'inputs.system' => {}
    }
}
```

Set Agent and Global Tag options on Telegraf host:
```puppet
node default {
  class { 'tick_stack::telegraf':
    agent => {
      'interval' => '10s'
    },
    global_tags => {
      'key1' => 'value1',
      'key2' => 'value2',
    }
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
