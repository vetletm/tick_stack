# == Class: tick_stack::telegraf
#
class tick_stack::telegraf (
  $ensure      = $tick_stack::telegraf::params::ensure,

  $template    = $tick_stack::telegraf::params::template,
  $conf_path   = $tick_stack::telegraf::params::conf_path,
  $global_tags = $tick_stack::telegraf::params::global_tags,
  $agent       = $tick_stack::telegraf::params::agent,
  $outputs     = $tick_stack::telegraf::params::outputs,
  $inputs      = $tick_stack::telegraf::params::inputs,

  $service     = $tick_stack::telegraf::params::service,
  $enable      = $tick_stack::telegraf::params::enable,
  $hasrestart  = $tick_stack::telegraf::params::hasrestart,
  $hasstatus   = $tick_stack::telegraf::params::hasstatus,


  ) inherits tick_stack::telegraf::params {

  include tick_stack::repo

  class {'tick_stack::install':
    require   => Class['tick_stack::repo'],
    ensure    => $ensure,
    component => 'telegraf'
  }
  -> class {'tick_stack::config':
    conf_path => $conf_path,
    template  => $template,
  }
  ~> class {'tick_stack::service':
    component  => 'telegraf',
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
