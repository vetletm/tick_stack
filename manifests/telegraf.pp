# == Class: tick_stack::telegraf
#
class tick_stack::telegraf (
  # For Install-class
  $ensure      = $tick_stack::telegraf::params::ensure,

  # For Config-class
  $conf_path   = $tick_stack::telegraf::params::conf_path,
  $template    = $tick_stack::telegraf::params::template,

  # For Service-class
  $service     = $tick_stack::telegraf::params::service,
  $enable      = $tick_stack::telegraf::params::enable,
  $hasrestart  = $tick_stack::telegraf::params::hasrestart,
  $hasstatus   = $tick_stack::telegraf::params::hasstatus,

  # Specific configuration hashes:
  Hash $global_tags = $tick_stack::telegraf::params::global_tags,
  Hash $agent       = $tick_stack::telegraf::params::agent,
  Hash $outputs     = $tick_stack::telegraf::params::outputs,
  Hash $inputs      = $tick_stack::telegraf::params::inputs,


  ) inherits tick_stack::telegraf::params {

  include tick_stack::repo

  contain tick_stack::telegraf::install
  contain tick_stack::telegraf::config
  contain tick_stack::telegraf::service

  Class['tick_stack::telegraf::install']
  -> Class['tick_stack::telegraf::config']
  ~> Class['tick_stack::telegraf::service']

}
