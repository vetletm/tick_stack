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

  contain tick_stack::telegraf::install
  contain tick_stack::telegraf::config
  contain tick_stack::telegraf::service

  Class['tick_stack::telegraf::install']
  -> Class['tick_stack::telegraf::config']
  ~> Class['tick_stack::telegraf::service']

}
