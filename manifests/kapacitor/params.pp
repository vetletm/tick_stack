# == Class: tick_stack::telegraf::params
#
class tick_stack::kapacitor::params {
  # Install options
  $ensure     = 'present'

  # Config options
  $path = '/etc/kapacitor/kapacitor.conf'
  $hostname = $facts['hostname']
  $data_dir = '/var/lib/kapacitor'
  $http = {
    'bind_address'      => '":9092"',
    'log_enabled'       => true,
    'write_tracing'     => false,
    'pprof_enabled'     => false,
    'https_enabled'     => false,
  }

  # Service options
  $service    = 'running'
  $enable     = true
  $hasrestart = true
  $hasstatus  = true

}
