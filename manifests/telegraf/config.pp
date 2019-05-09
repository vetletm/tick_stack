# == Class: tick_stack::telegraf::config
#
class tick_stack::telegraf::config {
  assert_private()

  $conf_path = $tick_stack::telegraf::conf_path
  $template  = $tick_stack::telegraf::template
  
  file { $conf_path:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($template)
  }
}
