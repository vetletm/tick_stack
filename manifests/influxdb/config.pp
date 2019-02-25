# == Class: tick_stack::influxdb::config
#
class tick_stack::influxdb::config (
  $path         = $tick_stack::influxdb::params::path,
  $bind_address = $tick_stack::influxdb::params::bind_address,

  $data_dir     = $tick_stack::influxdb::params::data_dir,
  $wal_dir      = $tick_stack::influxdb::params::wal_dir,
  $meta_dir     = $tick_stack::influxdb::params::meta_dir,

  $http_enable  = $tick_stack::influxdb::params::http_enable,
  $http_bind    = $tick_stack::influxdb::params::http_bind,

  ) inherits tick_stack::influxdb::params  {
  # InfluxDB
  $defaults_influxdb = {
    'ensure'          => present,
    'path'            => $path,
    'indent_char'     => ' ',
    'indent_width'    => 2,
  }

  $all_defaults_influxdb = {
    '' => {
      'bind-address' => $bind_address,
    },
    'data' => {
      'dir'                                 => $data_dir,
      'index-version'                       => '"inmem"',
      'wal-dir'                             => $wal_dir,
      'wal-fsync-delay'                     => '"0s"',
      'validate-keys'                       => false,
      'query-log-enabled'                   => true,
      'cache-max-memory-size'               => '1073741824',
      'cache-snapshot-memory-size'          => '26214400',
      'cache-snapshot-write-cold-duration'  => '"10m0s"',
      'compact-full-write-cold-duration'    => '"4h0m0s"',
      'compact-throughput'                  => '50331648',
      'compact-throughput-burst'            => '50331648',
      'max-series-per-database'             => '1000000',
      'max-values-per-tag'                  => '100000',
      'max-concurrent-compactions'          => '0',
      'max-index-log-file-size'             => '1048576',
      'series-id-set-cache-size'            => '100',
      'trace-logging-enabled'               => false,
      'tsm-use-madv-willneed'               => false,

    },
    'meta' => {
      'dir'                   => $meta_dir,
      'retention-autocreate'  => true,
      'logging-enabled'       => true,
    },
    'http' => {
      'enabled'       => $http_enable,
      'bind-address'  => $http_bind,
    }
  }
  create_ini_settings($all_defaults_influxdb, $defaults_influxdb)
}
