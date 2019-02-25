# == Class: tick_stack::telegraf
#
class tick_stack::telegraf (
  $username       = $tick_stack::telegraf::params::username,
  $password       = $tick_stack::telegraf::params::password,
  $url            = $tick_stack::telegraf::params::url,
  $database       = $tick_stack::telegraf::params::database,
  $precision      = $tick_stack::telegraf::params::precision,

  $ensure         = $tick_stack::telegraf::params::ensure,
  $conf_path      = $tick_stack::telegraf::params::conf_path,

  $service        = $tick_stack::telegraf::params::service,
  ) inherits tick_stack::telegraf::params {

  include tick_stack::repo

  class {'tick_stack::telegraf::install':
    require   => Class['tick_stack::repo'],
    ensure    => $ensure,
    conf_path => $conf_path,
  }
  -> class {'tick_stack::telegraf::config':
    url       => $url,
    database  => $database,
    precision => $precision,
    username  => $username,
    password  => $password,
  }
  ~> class {'tick_stack::telegraf::service':
    service => $service,
  }
}
