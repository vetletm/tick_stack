# == Class: tick_stack::chronograf::params
#
class tick_stack::chronograf::params {
  $ensure   = 'present'

  # Service options
  $service            = 'running'
  $enable             = true
  $hasrestart         = true
  $hasstatus          = true

  $conf_path          = '/etc/default/chronograf'
  $template           = 'tick_stack/chronograf.erb'
  # General options #
  $host               = '0.0.0.0'
  $port               = 8888
  # InfluxDB options #
  $influxdb_url       = 'http://127.0.0.1:8086'
  $influxdb_username  = undef
  $influxdb_password  = undef
  # Kapacitor options #
  $kapacitor_url      = undef
  $kapacitor_username = undef
  $kapacitor_password = undef
  # TLS options #
  $cert               = undef
  $key                = undef
}
