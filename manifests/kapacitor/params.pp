# == Class: tick_stack::telegraf::params
#
class tick_stack::kapacitor::params {
  # Install options
  $ensure     = 'present'

  # Config options
  $conf_path  = '/etc/kapacitor/kapacitor.conf'
  $template   = 'tick_stack/kapacitor.conf.erb'

  # Service options
  $service    = 'running'
  $enable     = true
  $hasrestart = true
  $hasstatus  = true

  # Meta
  $hostname = $facts['hostname']
  $data_dir = '/var/lib/kapacitor'

  # HTTP Settings:
  $http = {
    'bind_address'      => '":9092"',
    'log_enabled'       => true,
    'write_tracing'     => false,
    'pprof_enabled'     => false,
    'https_enabled'     => false,
  }

  # InfluxDB connection options:
  $influxdb = {
    'enabled'                     => true,
    'name'                        => '"default"',
    'default'                     => false,
    'urls'                        => '["http://localhost:8086"]',
    'username'                    => '""',
    'password'                    => '""',
    'ssl-ca'                      => '""',
    'ssl-cert'                    => '""',
    'ssl-key'                     => '""',
    'insecure-skip-verify'        => false,
    'timeout'                     => '"0s"',
    'disable-subscriptions'       => false,
    'subscription-protocol'       => '"http"',
    'subscription-mode'           => '"server"',
    'kapacitor-hostname'          => '""',
    'http-port'                   => 0,
    'udp-bind'                    => '""',
    'udp-buffer'                  => 1000,
    'udp-read-buffer'             => 0,
    'startup-timeout'             => '"5m0s"',
    'subscriptions-sync-interval' => '"1m0s"',
  }

  # The rest are suggested defaults:
  $replay = {
    'dir' => '"/var/lib/kapacitor/replay"'
  }

  $storage = {
    'boltdb' => '"/var/lib/kapacitor/kapacitor.db"'
  }

  $task = {
    'dir'               => '"/var/lib/kapacitor/tasks"',
    'snapshot-interval' => '"1m0s"'
  }

  $load = {
    'enabled' => 'false',
    'dir'     => '"/var/lib/kapacitor/load"'
  }

  $logging = {
    'file'  => '"STDERR"',
    'level' => '"DEBUG"'
  }

}
