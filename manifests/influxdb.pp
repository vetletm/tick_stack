# == Class: tick_stack::influxdb
#
class tick_stack::influxdb (
  # For Install-class
  $ensure                             = $tick_stack::influxdb::params::ensure,

  # For Config-class
  $conf_path                          = $tick_stack::influxdb::params::conf_path,
  $template                           = $tick_stack::influxdb::params::template,

  # For Service-class
  $service                            = $tick_stack::influxdb::params::service,
  $enable                             = $tick_stack::influxdb::params::enable,
  $hasrestart                         = $tick_stack::influxdb::params::hasrestart,
  $hasstatus                          = $tick_stack::influxdb::params::hasstatus,

  # Specific settings in config
  $bind_addr                          = $tick_stack::influxdb::params::bind_addr,
  $meta_dir                           = $tick_stack::influxdb::params::meta_dir,
  $data_dir                           = $tick_stack::influxdb::params::data_dir,
  $wal_dir                            = $tick_stack::influxdb::params::wal_dir,

  # Optionals for InfluxDB Data config
  $trace_logging_enabled              = $tick_stack::influxdb::params::trace_logging_enabled,
  $query_log_enabled                  = $tick_stack::influxdb::params::query_log_enabled,
  $cache_max_memory_size              = $tick_stack::influxdb::params::cache_max_memory_size,
  $cache_snapshot_memory_size         = $tick_stack::influxdb::params::cache_snapshot_memory_size,
  $cache_snapshot_write_cold_duration = $tick_stack::influxdb::params::cache_snapshot_write_cold_duration,
  $compact_full_write_cold_duration   = $tick_stack::influxdb::params::compact_full_write_cold_duration,
  $max_series_per_database            = $tick_stack::influxdb::params::max_series_per_database,
  $max_values_per_tag                 = $tick_stack::influxdb::params::max_values_per_tag,

  # Hashes for the config template
  Hash $http                          = $tick_stack::influxdb::params::http,
  Hash $coordinator                   = $tick_stack::influxdb::params::coordinator,
  Hash $retention                     = $tick_stack::influxdb::params::retention,
  Hash $shardprecreation              = $tick_stack::influxdb::params::shardprecreation,
  Hash $monitor                       = $tick_stack::influxdb::params::monitor,
  Hash $logging                       = $tick_stack::influxdb::params::logging,
  Hash $subscriber                    = $tick_stack::influxdb::params::subscriber,
  Hash $tls                           = $tick_stack::influxdb::params::tls,
  ) inherits tick_stack::influxdb::params  {
  include tick_stack::repo
  class {'tick_stack::influxdb::install':
    require => Class['tick_stack::repo'],
    ensure  => $ensure,
  }
  -> class {'tick_stack::influxdb::config':
    conf_path => $conf_path,
    template  => $template,
  }
  ~> class {'tick_stack::influxdb::service':
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
