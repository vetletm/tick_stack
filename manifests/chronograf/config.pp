# == Class: tick_stack::chronograf::config
#
class tick_stack::chronograf::config (
  $config = $tick_stack::chronograf::params::config,
  $conf_path = $tick_stack::chronograf::params::conf_path
  ) inherits tick_stack::chronograf::params {
    file { $conf_path:
      ensure  => file,
      content => $config,
    }
}
