# == Class: tick_stack::influxdb
#
class tick_stack::influxdb (
  $path             = $tick_stack::influxdb::params::path,
  $global           = $tick_stack::influxdb::params::global,
  $meta             = $tick_stack::influxdb::params::meta,
  $data             = $tick_stack::influxdb::params::data,
  $http             = $tick_stack::influxdb::params::http,
  $coordinator      = $tick_stack::influxdb::params::coordinator,
  $retention        = $tick_stack::influxdb::params::retention,
  $shardprecreation = $tick_stack::influxdb::params::shardprecreation,
  $monitor          = $tick_stack::influxdb::params::monitor,
  $logging          = $tick_stack::influxdb::params::logging,
  $subscriber       = $tick_stack::influxdb::params::subscriber,
  $tls              = $tick_stack::influxdb::params::tls,

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
    path             => $path,
    global           => $global,
    meta             => $meta,
    data             => $data,
    http             => $http,
    coordinator      => $coordinator,
    retention        => $retention,
    shardprecreation => $shardprecreation,
    monitor          => $monitor,
    logging          => $logging,
    subscriber       => $subscriber,
    tls              => $tls,
  }
  ~> class {'tick_stack::influxdb::service':
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
