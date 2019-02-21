# == Class: tick_stack::influxdb::config
#
class tick_stack::influxdb::config {
  # InfluxDB
  $defaults_influxdb = {
    'ensure'          => present,
    'require'         => Package['influxdb'],
    'notify'          => Service['influxdb'],
    'path'            => '/etc/influxdb/influxdb.conf',
    'indent_char'     => ' ',
    'indent_width'    => 2,
  }

  $all_defaults_influxdb = {
    '' => {
      'bind-address' => "\"0.0.0.0:8088\"",
    },
    'data' => {
      'dir'                                 => "\"/var/lib/influxdb/data\"",
      'index-version'                       => '"inmem"',
      'wal-dir'                             => "\"/var/lib/influxdb/wal\"",
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
      'dir'                   => "\"/var/lib/influxdb/meta\"",
      'retention-autocreate'  => true,
      'logging-enabled'       => true,
    },
    'http' => {
      'enabled'       => true,
      'bind-address'  => "\":8086\"",
    }
  }
  create_ini_settings($all_defaults_influxdb, $defaults_influxdb)

  service { 'influxdb':
   ensure  => running,
   enable  => true,
   restart => true,
  }
}
