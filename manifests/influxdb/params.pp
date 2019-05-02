# == Class: tick_stack::influxdb::params
#
class tick_stack::influxdb::params {
  # Install options
  $ensure     = 'present'

  # Config options
  $conf_path  = '/etc/influxdb/influxdb.conf'
  $template   = 'tick_stack/influxdb.conf.erb'

  # Service options
  $service    = 'running'
  $enable     = true
  $hasrestart = true
  $hasstatus  = true

  # Specific options for InfluxDB config
  $bind_addr = '127.0.0.1:8088'
  $meta_dir = '/var/lib/influxdb/meta'
  $data_dir = '/var/lib/influxdb/data'
  $wal_dir = '/var/lib/influxdb/wal'

  # Optionals for InfluxDB data config, defaults are InfluxDBs recommended settings
  $trace_logging_enabled              = false
  $query_log_enabled                  = true
  $cache_max_memory_size              = 1048576000
  $cache_snapshot_memory_size         = 26214400
  $cache_snapshot_write_cold_duration = '10m'
  $compact_full_write_cold_duration   = '4h'
  $max_series_per_database            = 1000000
  $max_values_per_tag                 = 100000

  # HTTP config hash
  $http             = {
    'http_enable' => true,
    'http_bind'   => '":8086"',
    'http_auth'   => false,
  }

  # Undefined hashes for the config template
  $coordinator      = {}
  $retention        = {}
  $shardprecreation = {}
  $monitor          = {}
  $logging          = {}
  $subscriber       = {}
  $tls              = {}

}
