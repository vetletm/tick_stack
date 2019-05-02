# == Class: tick_stack::kapacitor::config
#
class tick_stack::kapacitor::config(
  $conf_path = $tick_stack::kapacitor::params::conf_path,
  $template  = $tick_stack::kapacitor::params::template,
  ) inherits tick_stack::kapacitor::params {
  file { $conf_path:
    ensure  => file,
    content => template($template)
  }
}
