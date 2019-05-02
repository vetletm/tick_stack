# == Class: tick_stack::telegraf::params
#
class tick_stack::telegraf::params {
  # Install options
  $ensure     = 'present'

  # Config options
  $conf_path  = '/etc/telegraf/telegraf.conf'
  $template   = 'tick_stack/telegraf.conf.erb'

  # Service options
  $service    = 'running'
  $enable     = true
  $hasrestart = true
  $hasstatus  = true

  # Specific hashes for configuration of the agent
  $global_tags = {
    'dc' => 'home',
  }

  $agent       = {
    'interval' => '10s',
  }

  $outputs     = {
    'influxdb' => {
      'urls'      => [ 'http://localhost:8086' ],
      'database'  => '"telegraf"',
      'precision' => '"s"',
      },
  }

  $inputs      = {
    'cpu' => {
      'percpu'   => true,
      'totalcpu' => true,
    },
    'system' => {}
  }
}
