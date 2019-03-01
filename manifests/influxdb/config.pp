# == Class: tick_stack::influxdb::config
#
class tick_stack::influxdb::config (
  $path         = $tick_stack::influxdb::params::path,

  ) inherits tick_stack::influxdb::params  {
  file { $path:
    ensure  => file,
    content => template('tick_stack/influxdb.conf.erb')
  }
}
