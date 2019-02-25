# == Class: tick_stack::telegraf::params
#
class tick_stack::telegraf::params {
  $username   = '"telegraf"'
  $password   = '"telegraf"'
  $url        = '"http://127.0.0.1:8086"'
  $database   = '"telegraf"'
  $precision  = '"s"'
  $ensure     = 'present'
  $service    = 'running'
  $conf_path  = '/etc/telegraf/telegraf.conf'
}
