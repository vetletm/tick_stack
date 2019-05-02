# == Class: tick_stack::chronograf::config
#
class tick_stack::chronograf::config (
  $conf_path = $tick_stack::chronograf::params::conf_path,
  $template  = $tick_stack::chronograf::params::template,
  ) inherits tick_stack::chronograf::params {
    file { $conf_path:
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template($template),
    }
}
