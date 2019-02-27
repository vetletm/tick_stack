# == Class: tick_stack::chronograf::service
#
class tick_stack::chronograf::service (
  $service    = $tick_stack::chronograf::params::service,
  $enable     = $tick_stack::chronograf::params::enable,
  $hasrestart = $tick_stack::chronograf::params::hasrestart,
  $hasstatus  = $tick_stack::chronograf::params::hasstatus,
  $conf_path  = $tick_stack::chronograf::params::conf_path,
  $config     = $tick_stack::chronograf::params::config,
  ) inherits tick_stack::chronograf::params {
    service { 'chronograf':
      ensure     => $service,
      enable     => $enable,
      hasrestart => $hasrestart,
      hasstatus  => $hasstatus,
    }
}
