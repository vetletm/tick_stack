# == Class: tick_stack::influxdb
#
class tick_stack::influxdb (
  $path = $tick_stack::influxdb::params::path,
  $bind_address = $tick_stack::influxdb::params::bind_address,

  $data_dir = $tick_stack::influxdb::params::data_dir,
  $wal_dir = $tick_stack::influxdb::params::wal_dir,
  $meta_dir = $tick_stack::influxdb::params::meta_dir,

  $http_enable = $tick_stack::influxdb::params::http_enable,
  $http_bind = $tick_stack::influxdb::params::http_bind,

  $ensure = $tick_stack::influxdb::params::ensure,

  $service = $tick_stack::influxdb::params::service,
  ) inherits tick_stack::influxdb::params  {
  include tick_stack::repo
  class {'tick_stack::influxdb::install':
    require => Class['tick_stack::repo'],
    ensure  => $ensure,
  }
  -> class {'tick_stack::influxdb::config':
    path         => $path,
    bind_address => $bind_address,

    data_dir     => $data_dir,
    wal_dir      => $wal_dir,
    meta_dir     => $meta_dir,

    http_enable  => $http_enable,
    http_bind    => $http_bind,
  }
  ~> class {'tick_stack::influxdb::service':
    service => $service,
  }
}
