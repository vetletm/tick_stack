# == Class: tick_stack::telegraf
#
class tick_stack::telegraf (
  $ensure      = $tick_stack::telegraf::params::ensure,

  $global_tags = $tick_stack::telegraf::params::global_tags,
  $agent       = $tick_stack::telegraf::params::agent,
  $outputs     = $tick_stack::telegraf::params::outputs,
  $inputs      = $tick_stack::telegraf::params::inputs,
  $conf_path   = $tick_stack::telegraf::params::conf_path,
  $template    = $tick_stack::telegraf::params::template,

  $service     = $tick_stack::telegraf::params::service,
  $enable      = $tick_stack::telegraf::params::enable,
  $hasrestart  = $tick_stack::telegraf::params::hasrestart,
  $hasstatus   = $tick_stack::telegraf::params::hasstatus,


  ) inherits tick_stack::telegraf::params {

  include tick_stack::repo

  class {'tick_stack::telegraf::install':
    require => Class['tick_stack::repo'],
    ensure  => $ensure,
  }
  -> class {'tick_stack::telegraf::config':
    conf_path => $conf_path,
    template  => $template,
  }
  ~> class {'tick_stack::telegraf::service':
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
