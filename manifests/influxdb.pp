# == Class: tick_stack::influxdb
#
class tick_stack::influxdb (
  $path         = $tick_stack::influxdb::params::path,

  $ensure       = $tick_stack::influxdb::params::ensure,

  $service      = $tick_stack::influxdb::params::service,
  $enable       = $tick_stack::influxdb::params::enable,
  $hasrestart   = $tick_stack::influxdb::params::hasrestart,
  $hasstatus    = $tick_stack::influxdb::params::hasstatus,
  ) inherits tick_stack::influxdb::params  {
  include tick_stack::repo
  class {'tick_stack::influxdb::install':
    require => Class['tick_stack::repo'],
    ensure  => $ensure,
  }
  -> class {'tick_stack::influxdb::config':
    path => $path,
  }
  ~> class {'tick_stack::influxdb::service':
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
