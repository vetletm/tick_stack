# == Class: tick_stack::influxdb::config
#
class tick_stack::influxdb::config (
  $path             = $tick_stack::influxdb::params::path,
  $global           = $tick_stack::influxdb::params::global,
  $meta             = $tick_stack::influxdb::params::meta,
  $data             = $tick_stack::influxdb::params::data,
  $http             = $tick_stack::influxdb::params::http,
  $coordinator      = $tick_stack::influxdb::params::coordinator,
  $retention        = $tick_stack::influxdb::params::retention,
  $shardprecreation = $tick_stack::influxdb::params::shardprecreation,
  $monitor          = $tick_stack::influxdb::params::monitor,
  $logging          = $tick_stack::influxdb::params::logging,
  $subscriber       = $tick_stack::influxdb::params::subscriber,
  $tls              = $tick_stack::influxdb::params::tls,

  ) inherits tick_stack::influxdb::params  {
  file { $path:
    ensure  => file,
    content => template('tick_stack/influxdb.conf.erb')
  }
}
