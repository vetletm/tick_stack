# == Class: tick_stack::telegraf
#
class tick_stack::telegraf (
  $ensure      = $tick_stack::telegraf::params::ensure,

  $global_tags = $tick_stack::telegraf::params::global_tags,
  $agent       = $tick_stack::telegraf::params::agent,
  $outputs     = $tick_stack::telegraf::params::outputs,
  $inputs      = $tick_stack::telegraf::params::inputs,
  $conf_path   = $tick_stack::telegraf::params::conf_path,

  $service     = $tick_stack::telegraf::params::service,


  ) inherits tick_stack::telegraf::params {

  include tick_stack::repo

  class {'tick_stack::telegraf::install':
    require => Class['tick_stack::repo'],
    ensure  => $ensure,
  }
  -> class {'tick_stack::telegraf::config':
    conf_path   => $conf_path,
    global_tags => $global_tags,
    agent       => $agent,
    outputs     => $outputs,
    inputs      => $inputs,
  }
  ~> class {'tick_stack::telegraf::service':
    service => $service,
  }
}
