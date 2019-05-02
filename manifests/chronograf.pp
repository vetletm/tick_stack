# == Class: tick_stack::chronograf
#
class tick_stack::chronograf (
  $ensure             = $tick_stack::chronograf::params::ensure,

  $service            = $tick_stack::chronograf::params::service,
  $enable             = $tick_stack::chronograf::params::enable,
  $hasrestart         = $tick_stack::chronograf::params::hasrestart,
  $hasstatus          = $tick_stack::chronograf::params::hasstatus,

  $conf_path          = $tick_stack::chronograf::params::conf_path,
  $template           = $tick_stack::chronograf::params::template,
  $host               = $tick_stack::chronograf::params::host,
  $port               = $tick_stack::chronograf::params::port,
  $influxdb_url       = $tick_stack::chronograf::params::influxdb_url,
  $influxdb_username  = $tick_stack::chronograf::params::influxdb_username,
  $influxdb_password  = $tick_stack::chronograf::params::influxdb_password,
  $kapacitor_url      = $tick_stack::chronograf::params::kapacitor_url,
  $kapacitor_username = $tick_stack::chronograf::params::kapacitor_username,
  $kapacitor_password = $tick_stack::chronograf::params::kapacitor_password,
  $cert               = $tick_stack::chronograf::params::cert,
  $key                = $tick_stack::chronograf::params::key,

  ) inherits tick_stack::chronograf::params {
  include tick_stack::repo
  class {'tick_stack::chronograf::install':
    require => Class['tick_stack::repo'],
    ensure  => $ensure,
  }
  -> class {'tick_stack::chronograf::config':
    conf_path => $conf_path,
    template  => $template,
  }
  ~> class {'tick_stack::chronograf::service':
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
