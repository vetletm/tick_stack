# == Class: tick_stack::telegraf::config
#
class tick_stack::telegraf::config(
  $section_defaults = lookup(tick_stack::telegraf::section_defaults),
  $defaults         = lookup(tick_stack::telegraf::defaults),

  $url              = $tick_stack::telegraf::params::url,
  $database         = $tick_stack::telegraf::params::database,
  $precision        = $tick_stack::telegraf::params::precision,
  $username         = $tick_stack::telegraf::params::username,
  $password         = $tick_stack::telegraf::params::password,

  ) inherits tick_stack::telegraf::params {

  create_ini_settings($defaults,$section_defaults)

  $influxdb_config = {
    'outputs.influxdb' => {
      'url'       => $url,
      'database'  => $database,
      'precision' => $precision,
      'username'  => $username,
      'password'  => $password,
    }
  }

  create_ini_settings($influxdb_config,$section_defaults)
}
