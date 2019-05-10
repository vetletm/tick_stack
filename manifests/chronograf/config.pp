# == Class: tick_stack::chronograf::config
#
class tick_stack::chronograf::config {
  assert_private()

  $conf_path = $tick_stack::chronograf::conf_path
  $template  = $tick_stack::chronograf::template

  file { $conf_path:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($template),
  }
}
