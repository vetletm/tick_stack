# == Class: tick_stack::kapacitor::config
#
class tick_stack::kapacitor::config {
  assert_private()

  $conf_path = $tick_stack::kapacitor::conf_path
  $template  = $tick_stack::kapacitor::template

  file { $conf_path:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($template)
  }
}
