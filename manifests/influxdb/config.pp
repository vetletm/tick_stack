# == Class: tick_stack::influxdb::config
#
class tick_stack::influxdb::config (
  $conf_path = $tick_stack::influxdb::params::conf_path,
  $template  = $tick_stack::influxdb::params::template,

  ) inherits tick_stack::influxdb::params  {
  file { $conf_path:
    ensure  => file,
    content => template($template)
  }
}
