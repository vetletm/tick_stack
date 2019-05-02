# == Class: tick_stack::kapacitor
#
class tick_stack::kapacitor (
  $ensure     = $tick_stack::kapacitor::params::ensure,

  $conf_path  = $tick_stack::kapacitor::params::conf_path,
  $template   = $tick_stack::kapacitor::params::template,

  $service    = $tick_stack::kapacitor::params::service,
  $enable     = $tick_stack::kapacitor::params::enable,
  $hasrestart = $tick_stack::kapacitor::params::hasrestart,
  $hasstatus  = $tick_stack::kapacitor::params::hasstatus,

  ) inherits tick_stack::kapacitor::params {

  include tick_stack::repo

  class {'tick_stack::kapacitor::install':
    require => Class['tick_stack::repo'],
    ensure  => $ensure,
  }
  -> class {'tick_stack::kapacitor::config':
    conf_path => $conf_path,
    template  => $template,
  }
  ~> class {'tick_stack::kapacitor::service':
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
