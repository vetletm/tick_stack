# == Class: tick_stack::telegraf::config
#
class tick_stack::telegraf::config(
  $global_tags = $tick_stack::telegraf::params::global_tags,
  $agent       = $tick_stack::telegraf::params::agent,
  $outputs     = $tick_stack::telegraf::params::outputs,
  $inputs      = $tick_stack::telegraf::params::inputs,
  $conf_path   = $tick_stack::telegraf::params::conf_path,

  ) inherits tick_stack::telegraf::params {
  file { $conf_path:
    ensure  => file,
    content => template('tick_stack/telegraf.conf.erb')
  }
}
