# == Class: tick_stack::influxdb::params
#
class tick_stack::influxdb::params {
  $path           = '/etc/influxdb/influxdb.conf'
  $bind_address   = '"127.0.0.1:8088"'
  $data_dir       = '"/var/lib/influxdb/data"'
  $wal_dir        = '"/var/lib/influxdb/wal"'
  $meta_dir       = '"/var/lib/influxdb/meta"'

  $http_enable    = true
  $http_bind      = '":8086"'
  $http_auth      = false


  $ensure         = 'present'
  $service        = 'running'
}
