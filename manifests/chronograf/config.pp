# == Class: tick_stack::chronograf::config
#
class tick_stack::chronograf::config (
  $conf_path          = $tick_stack::chronograf::params::conf_path,
  $host               = $tick_stack::chronograf::params::host,
  $port               = $tick_stack::chronograf::params::port,
  $influxdb_url       = $tick_stack::chronograf::params::influxdb_url,
  $influxdb_username  = $tick_stack::chronograf::params::influxdb_username,
  $influxdb_password  = $tick_stack::chronograf::params::influxdb_password,
  $kapacitor_url      = $tick_stack::chronograf::params::kapacitor_url,
  $kapacitor_username = $tick_stack::chronograf::params::kapacitor_username,
  $kapacitor_password = $tick_stack::chronograf::params::kapacitor_password,
  $cert               = $tick_stack::chronograf::params::cert,
  $key                = $tick_stack::chronograf::params::key,
  ) inherits tick_stack::chronograf::params {
    file { $conf_path:
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('tick_stack/chronograf.erb'),
    }
}
