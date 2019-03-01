# == Class: tick_stack::influxdb::params
#
class tick_stack::influxdb::params {
  # Install options
  $ensure         = 'present'

  # Config options
  $path           = '/etc/influxdb/influxdb.conf'
  $global = {
    'bind-address'  => '"127.0.0.1:8088"'
  }
  $meta = {
    'dir' => '"/var/lib/influxdb/meta"'
  }
  $data = {
    'dir'                                => '"/var/lib/influxdb/data"',
    'wal-dir'                            => '"/var/lib/influxdb/wal"',
    'index-version'                      => '"inmem"',
    'wal-fsync-delay'                    => '"0s"',
    'validate-keys'                      => false,
    'query-log-enabled'                  => true,
    'cache-max-memory-size'              => '1073741824',
    'cache-snapshot-memory-size'         => '26214400',
    'cache-snapshot-write-cold-duration' => '"10m0s"',
    'compact-full-write-cold-duration'   => '"4h0m0s"',
    'compact-throughput'                 => '50331648',
    'compact-throughput-burst'           => '50331648',
    'max-series-per-database'            => '1000000',
    'max-values-per-tag'                 => '100000',
    'max-concurrent-compactions'         => '0',
    'max-index-log-file-size'            => '1048576',
    'series-id-set-cache-size'           => '100',
    'trace-logging-enabled'              => false,
    'tsm-use-madv-willneed'              => false,
  }
  $http             = {
    'http_enable' => true,
    'http_bind'   => '":8086"',
    'http_auth'   => false,
  }
  $coordinator      = undef
  $retention        = undef
  $shardprecreation = undef
  $monitor          = undef
  $logging          = undef
  $subscriber       = undef
  $tls              = undef

  # Service options
  $service            = 'running'
  $enable             = true
  $hasrestart         = true
  $hasstatus          = true

}
