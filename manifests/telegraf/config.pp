# == Class: tick_stack::telegraf::config
#
class tick_stack::telegraf::config(
  $conf_path = $tick_stack::telegraf::params::conf_path,
  $template  = $tick_stack::telegraf::params::template,

  ) inherits tick_stack::telegraf::params {
  file { $conf_path:
    ensure  => file,
    content => template($template)
  }
}
