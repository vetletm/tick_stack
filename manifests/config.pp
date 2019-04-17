# == Class: tick_stack::telegraf::config
#
class tick_stack::config(
  $conf_path   = undef,
  $template    = undef,
  ) {

  assert_private()

  file { $conf_path:
    ensure  => file,
    content => template($template)
  }
}
