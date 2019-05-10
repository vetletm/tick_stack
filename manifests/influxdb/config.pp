# == Class: tick_stack::influxdb::config
#
class tick_stack::influxdb::config {
  assert_private()

  $conf_path = $tick_stack::influxdb::conf_path
  $template  = $tick_stack::influxdb::template

  file { $conf_path:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($template)
  }
}
